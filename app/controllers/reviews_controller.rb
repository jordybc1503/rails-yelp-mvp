class ReviewsController < ApplicationController


  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_parameters)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurant/show", status: :unprocessable_entity
    end
  end

  private

  def review_parameters
    params.require(:review).permit(:rating, :content)
  end
end
