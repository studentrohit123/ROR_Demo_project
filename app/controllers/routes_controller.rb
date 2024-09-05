class RoutesController < ApplicationController

  before_action :get_route, only: [:edit, :update, :destroy]

  def index
    @routes = Route.all
  end
  
  def new 
    @route = Route.new
  end

  def create 
    @route = Route.new(route_params)
    if @route.save
      redirect_to routes_path(@route), notice: 'Route was successfully create'
    else
      render :new
    end
  end

  def edit 
  end

  def update
    if @route.update(route_params)
      redirect_to routes_path(@route), notice: 'Route information was successfully update.'
    else
        render :edit
    end
  end
  
  def destroy 
    @route.destroy
    redirect_to routes_path(@route), notice: 'Route was successfully deleted.'
  end

  def get_route
    @route = Route.find(params[:id])
  end

  private 
  def route_params 
  params.require(:route).permit(:source, :destination, :distance).transform_values(&:strip)
  end
end
