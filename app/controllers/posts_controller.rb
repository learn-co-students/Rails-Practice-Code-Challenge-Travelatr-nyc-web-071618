class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    # byebug
  end

  def update
    @post = Post.update(post_params)
    # byebug
    redirect_to post_path(@post)
  end

  def likes
    # byebug
    @post = Post.find(params[:post_id])
    @post.increment!(:likes)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Peace out to your post."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end


end
