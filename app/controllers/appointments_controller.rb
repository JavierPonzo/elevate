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

  def edit

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
      redirect_to appointments_path, alert: "Permiso denegado"
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.status = "Pendiente"
    if @appointment.save
      redirect_to my_appointments_path, notice: 'Tu cita ha sido creada exitosamente'
    else
      @doctors = Doctor.all
      render :new , alert: 'Tu cita no ha sido creada, por favor intenta nuevamente.'
    end
  end

  # def destroy
  #   @appointment = Appointment.find(params[:id])
  #   @appointment.destroy
  #   redirect_to appointments_path, notice: "Tu cita ha sido cancelada"
  # end
  #
  def destroy
    @appointment.destroy
    redirect_to my_appointments_path, notice: "Tu cita ha sido cancelada."
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
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

  private

  def appointment_params
    params.require(:appointment).permit(:date, :details, :doctor_id, :status)
  end
end
