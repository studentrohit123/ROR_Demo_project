class BusesController < ApplicationController

  before_action :get_bus, only: [:edit, :update]

  def index 
    @bus = Bus.all 
  end

  def new 
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      redirect_to buses_path, notice: 'Bus information was successfully create'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @bus.update(bus_params)
      redirect_to   buses_path(@bus), notice: 'Bus information was successfully update.'
    else
      render :edit
    end
  end
  
  def destroy
    @bus.destroy
    redirect_to buses_path(@bus), notice: 'Bus was successfully deleted.'
  end

  private

  def get_bus
    @bus = Bus.find(params[:id])
  end

  def bus_params
    params.require(:bus).permit(:name, :number, :capacity, :bus_class)
  end
end

