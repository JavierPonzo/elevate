class QuestionAnswersController < ApplicationController
  before_action :set_post
  def index
    @question_answers = @post.question_answers
  end

  def new
    @question_answer = @post.question_answers.new
  end

  def create
   @question_answer = @post.question_answers.new(question_answer_params)
   @question_answer.user = current_user
    if @question_answer.save
      redirect_to post_path(@post), notice: 'Tu pregunta será respondida a la brevedad.'
    else
      render :new, alert: 'Tu pregunta no fue posible, intenta otra vez.'
    end
  end
  private

  def question_answer_params
    params.require(:question_answer).permit(:question, :answer)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

  #def set_question_answer
   # @question_answer = @post.question_answer.find(params[:id])
  #end
