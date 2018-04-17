class PostsController < ApplicationController

  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post received"
      redirect_to @post
    else
      flash[:alert] = "Please select an image to post"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post updated'
      redirect_to root_path
    else
      flash[:alert] = 'Please try again'
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end




end
