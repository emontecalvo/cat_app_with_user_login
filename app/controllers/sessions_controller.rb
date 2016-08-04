class SessionsController < ApplicationController

  before_action :logged_in?, only: [:new, :create]

  def new
    # @session = Session.new
    render :new
  end

  def create # login
    login_user!
  end

  def destroy # logout
    return nil if current_user.nil?
    hold_token = current_user.session_token
    current_user.reset_session_token!
    @session = Session.find_by(session_token: hold_token)
    @session[:session_token] = nil
  end

end
