class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      set_cart
      redirect_to '/', alert: 'You have successfully signed up'
    else
      redirect_to '/signup', alert: 'Something went wrong'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
