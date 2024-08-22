class HomepagesController < ApplicationController
  def index
    if params[:source].present? && params[:destination].present?
      @routes = Route.where(source: params[:source], destination: params[:destination])
    elsif params[:source].present?
      @routes = Route.where(source: params[:source])
    elsif params[:destination].present?
      @routes = Route.where(destination: params[:destination])
    else
      @routes = Route.all
    end
  end
end
