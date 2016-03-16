class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_owner!, only: [:index, :show]
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = current_owner.restaurants.build
  end
  
  def create
    @restaurant = current_owner.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end
  
  def destroy
    @restaurant.delete
    redirect_to root_url
  end
  
  private
    def restaurant_params
      params.required(:restaurant).permit(:name, :description, :full_address, :phone_number)
    end
    
    def set_restaurant
      @restaurant = current_owner.restaurants.find(params[:id])
    end
end
