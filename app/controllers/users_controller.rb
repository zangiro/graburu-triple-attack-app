class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @users = User.all  # すべてのユーザーを取得
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :agree_terms)
  end
end
