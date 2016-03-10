class SessionsController < ApplicationController

  def create
  	@user = User.authenticate(params[:username], params[:password], params[:remember])
    if @user 
      session[:user_name] = @user['name']
      session[:isadmin] = @user['isadmin']
      @message = "Login success"
      logger.debug @message 
    else
      @message = "Login error"
      logger.debug @message 
    end
  	respond_to do |format|
      if @user['login_token']
        cookies.permanent.signed[:user_id] = @user['s_id']
        cookies.permanent[:remember_token] = @user['login_token']
      end

      format.js {
        flash[:notice] = @message
        render :template => 'create.js.erb'
      }
  	end
  end

  def destroy
    cookies[:user_id] = nil
    cookies[:remember_token] = nil
    cookies.delete :user_id
    cookies.delete :remember_token

    reset_session
    @message = '您已經登出！'
    flash[:notice] = @message
    
    redirect_to login_path
  end
end
