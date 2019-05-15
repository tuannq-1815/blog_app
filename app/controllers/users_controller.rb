class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.order_by_name.page params[:page]
  end

  def show
    @entries = current_user.entries.page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t(".welcome")
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find params[:id]
    return if @user
    flash[:error] = t ".not_found"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
        :password_confirmation
  end

  def correct_user
    @user = User.find_by params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
