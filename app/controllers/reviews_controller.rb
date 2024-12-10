 class ReviewsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @review = @post.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to post_path(@post), notice: 'Review created succesfully'
    else
      redirect_to post_path(@post), alert: "Error, Review can't be blank"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to post_path(@review.post)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :post_id)
  end
 end
