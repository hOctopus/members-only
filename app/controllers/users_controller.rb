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
      flash[:success] = "Sign up successful!"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Sign up failed."
      redirect_to new_user_path
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to login_url
  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:password,
                                   :password_confirmation)
    end
end
