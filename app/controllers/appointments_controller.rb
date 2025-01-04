require 'stripe'

class AppointmentsController < ApplicationController
  def index
    if current_user.doctor?
      @appointments = Appointment.where(doctor_id: current_user.doctor.id, status: "Pendiente")
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
    @appointment = Appointment.new
    @doctors = Doctor.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    if @appointment.user == current_user || @appointment.doctor && @appointment.doctor.user == current_user
    else
      redirect_to my_appointments_path, alert: "Permiso denegado"
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.status = "Pendiente"
    if @appointment.save
      redirect_to my_appointments_path(@appointment), notice: "Cita creada, procede al pago."
    else
      @doctors = Doctor.all
      render :new , alert: 'Tu cita no ha sido creada, por favor intenta nuevamente.'
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
    @appointment.destroy
    redirect_to my_appointments_path, notice: "Tu cita ha sido cancelada."
  end

  def my_appointments
    user = User.find(current_user.id)
    role = user.role
    if role == "patient"
      @appointments = user.appointments
    else
      @doctor = Doctor.where(user: user)[0]
      @appointments = @doctor.appointments
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  private


  def appointment_params
    params.require(:appointment).permit(:date, :details, :doctor_id, :status)
  end
end
