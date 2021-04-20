class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

 def top
 end

 def index
   @posts = Post.all
 end

 def new
   @post = Post.new
 end

 def create
   @post = Post.new(post_params)
   # @post = current_user.posts.build(post_params)
   # if params[:back]
   #   render :new
   # else
     if @post.save
       redirect_to posts_path
     else
       render :new
     end
   # end
 end

 def show
   # @favorite = current_user.favorites.find_by(post_id: @post.id)
 end

 def edit
   # if @post.user == current_user
   #   render :edit
   # else
   #   redirect_to posts_path
   # end
 end

 def update
   if @post.update(post_params)
     redirect_to posts_path
   else
     render :edit
   end
 end

 def destroy
   @post.destroy
   redirect_to posts_path
 end

 def confirm
   # @post = current_user.posts.build(post_params)
   render :new if @post.invalid?
 end

 private
 def post_params
   params.require(:post).permit(:content, :image, :image_cache)
 end

 def set_post
   @post = Post.find(params[:id])
 end
end
