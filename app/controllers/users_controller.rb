class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def index
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      flash[:success] = "Success!"
      redirect_to "/"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
