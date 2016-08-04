

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  attr_reader :current_user

  def current_user
    @current_user ||= User.find_by({session_token: session[:session_token]})
  end

  def login_user!
    user_name = params[:user][:user_name]
    password = params[:password]
    @user = User.find_by_credentials(user_name, password)
    fail
    if @user
      #log in the user
      @user.is_password?(password)
      @session = Session.new
      @session[:session_token] = @user.reset_session_token!
      redirect_to cats_url
    else
      redirect_to cats_url
    end
  end

  def logged_in?
    if current_user
      redirect_to cats_url
    end
  end
end
