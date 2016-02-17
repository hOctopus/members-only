class UsersController < ApplicationController

  def show
    User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user
    else
      flash.now[:error] = "Sign up failed."
      render 'new'
    end
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:password,
                                   :password_confirmation)
    end
end
