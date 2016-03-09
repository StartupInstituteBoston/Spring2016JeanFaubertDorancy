class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
  end
  
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end
  
  def destroy
    Restaurant.find(params[:id]).delete
    redirect_to root_url
  end
  
  private
    def restaurant_params
      params.required(:restaurant).permit(:name, :description, :full_address, :phone_number)
    end
end
