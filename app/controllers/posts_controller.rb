class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].present?
      if params[:category] == 'salud_mental'
        @posts = Post.where(category: 'Salud Mental')
        @category = 'Salud Mental'
      elsif params[:category] == 'salud_sexual'
        @posts = Post.where(category: 'Salud Sexual')
        @category = 'Salud Sexual'
      end
    elsif params[:query].present?
      @posts = Post.where("title ILIKE ?", "%#{params[:query]}%")
      @category = 'Relacionado con tu busqueda'
    else
      @posts = Post.all
      @category = 'Articulos'
    end
  end


  def search_suggestions
    query = params[:query]
    @posts = Post.elevate_search(query).limit(5)
    suggestions = @posts.map do |post|
      {title: post.title, id: post.id}
    end
    render json: suggestions
  end

  def show
    @question_answer = QuestionAnswer.new
    @question_answers = @post.question_answers
    @doctors = Doctor.all
    @doctor = Doctor.where(id: @post.doctor_id) #Necesario para el mapa
    @appointment = Appointment.new
    @markers = @doctor.geocoded.map do |doc|
      {
        lat: doc.latitude,
        lng: doc.longitude
      }
    end
  end

  def new
    @post = Post.new
    @post.doctor_id = current_user.doctor&.id
  end

  def create
    if current_user.doctor?
      doctor = current_user.doctor
      if doctor.nil?
        flash[:alert] = "No se encontró un doctor asociado a este usuario."
        redirect_to posts_path and return
      end

      @post = doctor.posts.new(post_params)
      if @post.save
        redirect_to post_path(@post), notice: "Artículo creado exitosamente."
      else
        flash[:alert] = "No se pudo crear el artículo. Por favor, verifica los datos."
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to posts_path, alert: "Solo los doctores pueden crear artículos."
    end
  end


  def edit
    redirect_to post_path, alert: "No tenes permiso para editar este articulo." unless @post.doctor_id == current_user.doctor&.id
  end

  def update
    @post.doctor_id = current_user.doctor&.id
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  def my_posts
  if current_user.doctor?
    doctor = current_user.doctor
    @posts = doctor.present? ? doctor.posts : []
  else
    flash[:alert] = "No tienes permiso para esta sección."
    redirect_to posts_path
  end
end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :category, :content, photos: [])
  end
end
