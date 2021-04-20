class FavoritesController < ApplicationController

    def create
      @post = Post.find(params[:post_id])
      favorite = current_user.favorites.create(post_id: params[:post_id])
      redirect_to post_path(@post)
    end

    def destroy
      @post = Post.find(params[:id])
      favorites = current_user.favorites.find_by(post_id: @post).destroy
      redirect_to post_path(@post)
    end

    def index
      @favorites = Favorite.where(user_id: current_user.id).all
    end

end
