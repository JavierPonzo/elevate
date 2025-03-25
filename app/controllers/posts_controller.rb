class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].present?
      @posts = Post.where(category: params[:category])
      @category = I18n.t("categories.#{params[:category]}")
    elsif params[:query].present?
      @posts = Post.where("title ILIKE ?", "%#{params[:query]}%")
      @category = t('post.index.related_to_search')
    else
      @posts = Post.all
      @category = t('post.index.all_articles')
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
        flash[:alert] = t('post.create.no_doctor')
        redirect_to posts_path and return
      end

      @post = doctor.posts.new(post_params)
      if @post.save
        redirect_to post_path(@post), notice: t('post.create.success')
      else
        flash.now[:alert] = t('post.create.failure')
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to posts_path, alert: t('post.create.not_allowed')
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
    params.require(:post).permit(:title, :category, :rich_content, photos: [])
  end
end
