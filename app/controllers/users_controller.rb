class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    
    @user = User.find(params[:id])
  end

  def update
    #ユーザーの取得
    @user =  User.find(params[:id])
    #　ユーザーのアップデート
    @user.update(user_params)
    # ユーザーの詳細ページへのパス
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

end
