class RestaurantsController < ApplicationController
  # get /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # get restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  #post restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # get restaurants
  def create
    @restaurant = Restaurant.new(restaurant_parameters)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end


  # get restaurants/:id/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.update(restaurant_parameters)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_parameters
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
