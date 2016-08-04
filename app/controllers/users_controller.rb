class UsersController < ApplicationController

  before_action :logged_in?

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to cats_url
      login_user!
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
