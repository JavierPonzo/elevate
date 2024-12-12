class AppointmentsController < ApplicationController
  def index
    if current_user.doctor?
      @appointments = Appointment.where(doctor_id: current_user.doctor.id)
    else
      @appointments = current_user.appointments
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
      redirect_to appointments_path, alert: "Permission Denied"
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.status = "Pending"
    if @appointment.save
      redirect_to appointments_path, notice: 'Your appointment has succesfully been created'
    else
      @doctors = Doctor.all
      render :new , alert: 'Your appointment has failed to be created, please double check your information.'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, notice: "Your appointment has succesfully been deleted"
  end

  def my_appointments
    @appointments = current_user.appointments
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :details, :doctor_id)
  end
end
