class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #before_action :autherticate_user!, except: [:init, :login]

  protected
  def authenticate_user!
    if (!session[:user_name])
      @message = '您尚未登入'
      flash[:error] = @message
      redirect_to login_url
    else
      nil
    end
  end

  helper_method :authenticate_user!

  def current_user
    @current_user ||= User.find(session[:user_name]) if session[:user_name]
  end

  helper_method :current_user

  def init
  end

  def login
  end

end
