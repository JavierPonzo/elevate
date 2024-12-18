 class ReviewsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @review = @post.reviews.new(review_params)
    @review.user = current_user
    @review.post = @post
    if @review.save
      redirect_to post_path(@post), notice: 'Reseña creada exitosamente'
    else
      redirect_to post_path(@post), alert: "Error, la reseña no puede estar en blanco"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to post_path(@review.post)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
