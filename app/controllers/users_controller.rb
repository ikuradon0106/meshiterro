class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
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

end
