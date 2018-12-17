class PostsController < ApplicationController
	before_action :authenticate_user!
  	before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
  end
  def new
  	@post = Post.new
  end
  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  		redirect_to root_path
  	end
    else
      flash[:error] = "Post has error"
      render 'new'
    end  
  end
  def show
  end
  def edit
  end
  def update
  	@post.update(post_params)
     if @post.save
     	redirect_to root_path(@post.id)
     end
     else
      flash[:error] = "Post has error"
      render 'edit'
    end
    
  def destroy
  	@post.destroy
    redirect_to root_path
  end
  
  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :description, :price)
  end
  def find_post
   @post = Post.find_by(id: params[:id])
  end
