class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, success: t("flash_message.user_create")
    else
      flash.now[:danger] = t("flash_message.failure")
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(current_user), success: t("flash_message.update_success")
    else
      flash.now[:danger] = t("flash_message.update_failure")
      render :edit, status: :unprocessable_entity
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
