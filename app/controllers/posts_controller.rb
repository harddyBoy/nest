class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update,:destroy]

  def index
  	@posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: "Saved!"
    else 
      flash[:danger] = "Not Saved!"
      render :new
    end
  end

  def show
  
  end

  def edit
    
  end

  def new
    @post = Post.new
  end

  def update
   
    if @post.update_attributes(post_params)
      redirect_to @post, success: "Saved!"
    else 
      flash[:danger] = "Not Saved!"
      render :edit
    end
  end

  def destroy
    
    @post.destroy

    redirect_to posts_path, success: "Deleted!"
  end

  private

    def post_params
      params.require(:post).permit(:title, :summary, :body, :image) #image add by gem magick
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
