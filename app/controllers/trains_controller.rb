class TrainsController < ApplicationController
  def index 
    if params[:source].present? && params[:destination].present?
      @routes = Route.where(source: params[:source], destination: params[:destination])
    else
      @routes = Route.all
    end
  end

  def show
    @route = Route.find(params[:id])
    @trains = @route.trains
  end
end
