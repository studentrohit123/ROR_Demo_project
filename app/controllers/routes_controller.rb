class RoutesController < ApplicationController
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
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    if @route.update(route_params)
      redirect_to routes_path(@route), notice: 'Route information was successfully updates.'
    else
        render :edit
    end
  end

  def destroy 
    @route = Route.find(params[:id])
    @route.destroy
    redirect_to routes_path(@route), notice: 'Route was successfully deleted.'
  end

  private 
  def route_params 
  params.require(:route).permit(:source, :destination, :distance)
  end
end
