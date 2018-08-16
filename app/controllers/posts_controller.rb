class PostsController < ApplicationController
  before_action :find_post, only:[:show, :edit, :update, :delete, :like]
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def like
    @likes = @post.likes + 1
    @post.update(likes: @likes)
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
