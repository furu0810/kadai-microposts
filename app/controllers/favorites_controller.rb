class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.likes(micropost)
    flash[:success] = "お気に入り登録しました。"
    redirect_to user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = "お気に入りの登録を解除しました。"
    redirect_to user
  end
end
