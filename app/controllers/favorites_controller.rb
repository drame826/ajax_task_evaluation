class FavoritesController < ApplicationController
  before_action :set_blog

  #def create
   # current_user.favorites.create(blog_id: params[:blog_id])
  #end

  def create
    @favorite = @blog.favorites.build(comment_params)
    respond_to do |format|
      if @favorite.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :index }
      end
    end
  end

 # def destroy
  #  current_user.favorites.find_by(id: params[:id]).destroy
  #end

  def destroy
    @favorite = favorite.find(params[:id])
      @favorite.destroy!
      respond_to do |format|
        flash.now[:notice] = 'コメントが削除されました'
        format.js { render :index }
      end
  end

  private
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
