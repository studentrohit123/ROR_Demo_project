class BusesController < ApplicationController

  before_action :get_bus, only: [:edit, :update, :destroy]

  def index 
    @bus = Bus.all 
  end
 
  def show
    @route = Route.find(params[:id])
    @bus = @route.buses
  end

  def new 
    @bus = Bus.new
    @routes = Route.all
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      redirect_to buses_path(@bus), notice: 'Bus information was successfully create'
    else
      @routes = Route.all
      render :new
    end
  end
  
  def edit
    @routes = Route.all
  end

  def update
    if @bus.update(bus_params)
      redirect_to buses_path(@bus), notice: 'Bus information was successfully update.'
    else
      render :edit
    end
  end
  
  def destroy
    @bus.destroy
    redirect_to buses_path(@bus), notice: 'Bus was successfully deleted.'
  end

  def get_bus
    @bus = Bus.find(params[:id])
  end

  private
  def bus_params
    params.require(:bus).permit(:name, :number, :total_seats, :bus_class,:route_id,:departure_time,:arrival_time,:price,:image)
  end
end
