class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].present?
      @posts = Post.where(category: 'Salud Mental') if params[:category] == 'salud_mental'
      @posts = Post.where(category: 'Salud Sexual') if params[:category] == 'salud_sexual'
    elsif
      params[:query].present?
      @posts = Post.where("title ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    else
      @posts = Post.all
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
    @appointment = Appointment.new
  end

  def new
    @post = Post.new
    @post.doctor_id = current_user.doctor&.id
  end

  def create
    if current_user.doctor?
      @post = Post.new(post_params)
      @post.doctor_id = current_user.doctor&.id
      if @post.save
        redirect_to post_path(@post)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to posts_path, alert: "Solo Doctores pueden crear articulos"
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
    @posts = current_user.doctor.posts if current_user.doctor?
    redirect_to posts_path, alert: "No tienes permiso" if @posts.blank?
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :category, :content, photos: [])
  end
end
