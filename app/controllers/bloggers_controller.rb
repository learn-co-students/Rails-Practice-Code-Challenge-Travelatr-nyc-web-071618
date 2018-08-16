class BloggersController < ApplicationController
  before_action :find_blogger, only:[:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path, @blogger
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end
end
