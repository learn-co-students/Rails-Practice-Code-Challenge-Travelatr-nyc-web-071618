class BloggersController < ApplicationController

  def show
    @blogger = Blogger.find(params[:id])
    @most_liked_post = @blogger.featured_post
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end



end
