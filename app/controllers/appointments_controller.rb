require 'stripe'

class AppointmentsController < ApplicationController
  def index
    if current_user.doctor?
      @appointments = Appointment.where(doctor_id: current_user.doctor.id, status: "Pendiente").order(date: :desc)
    else
      @appointments = current_user.appointments
    end
  end

  def confirm
    @appointment = Appointment.find(params[:id])
    if current_user.doctor? && @appointment.status == "Pendiente"
      @appointment.update(status: "Confirmado")
      redirect_to my_appointments_path, notice: "Cita confirmada exitosamente."
    else
      redirect_to my_appointments_path, alert: "No tienes permiso para confirmar esta cita."
    end
  end


  def update
    @appointment = Appointment.find(params[:id])
    if current_user.patient? && @appointment.user == current_user
      if params[:appointment][:status] == "Cancelado"
        @appointment.update(status: "Cancelado")
        notice_message = "La cita ha sido cancelada."
      else
        @appointment.update(appointment_params)
        notice_message = "La cita ha sido reprogramada."
      end
      redirect_to my_appointments_path, notice: notice_message
    else
      redirect_to my_appointments_path, alert: "No tienes permiso para modificar esta cita."
    end
  end

  def new
    if current_user.patient?
    @appointment = Appointment.new
    @doctors = Doctor.all
    else
      redirect_to my_appointments_path, alert: "Solo pacientes pueden agendar citas!"
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    if @appointment.user == current_user || @appointment.doctor && @appointment.doctor.user == current_user
    else
      redirect_to my_appointments_path, alert: "Permiso denegado"
    end
  end

  def create
    if current_user.doctor?
      flash[:alert] = "No tienes permiso para crear una cita."
      redirect_to posts_path and return
    end

    date = params[:appointment][:date]
    time = params[:appointment][:time]

    if date.present? && time.present?
      combined_datetime = DateTime.parse("#{date} #{time}")
    else
      flash[:alert] = "La fecha y hora son requeridas."
      redirect_to new_appointment_path and return
    end

    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.date = combined_datetime.to_date
    @appointment.time = combined_datetime.to_time
    @appointment.status = "Pendiente"

    if @appointment.save
      redirect_to my_appointments_path(@appointment), notice: "Cita creada, procede al pago."
    else
      @doctors = Doctor.all
      flash[:alert] = 'Tu cita no ha sido creada, por favor intenta nuevamente.'
      render :new, status: :unprocessable_entity
    end
  end





  def create_checkout_session
    @appointment = Appointment.find(params[:id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: "Cita con #{@appointment.doctor.user.name} #{@appointment.doctor.user.last_name}"
          },
          unit_amount: 3000,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: payment_success_appointment_url(@appointment),
      cancel_url: payment_cancel_appointment_url(@appointment)
    )

    redirect_to session.url, allow_other_host: true
  end

  def payment_success
    @appointment = Appointment.find(params[:id])
    @appointment.update(paid: true, status: "Confirmado")
    redirect_to my_appointments_path
    flash[:notice] = "Pago exitoso. Tu cita ha sido confirmada!"
  end

  def payment_cancel
    flash[:alert] = "El pago fue cancelado. Puedes intentarlo nuevamente."
    redirect_to my_appointments_path
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment
      @appointment.destroy
      redirect_to my_appointments_path, notice: "Tu cita ha sido cancelada."
    else
      redirect_to my_appointments_path, alert: "No se pudo encontrar la cita."
    end
  end

  def my_appointments
    user = User.find(current_user.id)
    role = user.role

    if role == "patient"
      @appointments = user.appointments.order(date: :desc) # Lista vacía si no hay citas
    else
      @doctor = Doctor.find_by(user: user)
      if @doctor.present?
        @appointments = @doctor.appointments.order(date: :desc)
      else
        @appointments = []
        flash[:alert] = "No se encontraron citas asociadas a este usuario."
      end
    end
  end



  def edit
    @appointment = Appointment.find(params[:id])
  end

  private


  def appointment_params
    params.require(:appointment).permit(:date, :time, :details, :doctor_id, :status)
  end
end
