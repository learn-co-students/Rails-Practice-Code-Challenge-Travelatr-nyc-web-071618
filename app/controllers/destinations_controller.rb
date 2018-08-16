class DestinationsController < ApplicationController
  before_action :find_destination, only:[:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :country)
  end

  def find_destination
    @destination = Destination.find(params[:id])
  end
end
