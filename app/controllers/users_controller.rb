class UsersController < ApplicationController
  #before_action :authorize_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @doctor = @user.doctor if @user.doctor?
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if @user.doctor? && params[:doctor].present?
        @user.doctor.update(doctor_params)
      end

      redirect_to user_path(@user), notice: "Perfil actualizado exitosamente."
    else
      render :edit, alert: "Hubo un error al actualizar el perfil."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :photo)
  end


  def doctor_params
    params.require(:doctor).permit(:specialty, :license)
  end

  def authorize_user
    redirect_to user_path(current_user), alert: "No tienes permiso para editar este perfil" unless @user == current_user
  end
end
