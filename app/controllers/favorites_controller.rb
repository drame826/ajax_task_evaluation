class FavoritesController < ApplicationController
  before_action :set_blog

  def create
    current_user.favorites.create(blog_id: params[:blog_id])
  end

  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
  end

  private
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
