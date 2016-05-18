class SessionsController < ApplicationController

  def index

    if @user
      redirect_to main_path 
    else 
      redirect_to login_path 
    end
  end

  def create
    @user = User.authenticate(params[:username], params[:password], params[:remember])
    if @user 
      session[:user_name] = @user['name']
      session[:isadmin] = @user['isadmin']
      @message = "登入成功"

      if @user['login_token']
        cookies.permanent.signed[:user_id] = @user['s_id']
        cookies.permanent[:remember_token] = @user['login_token']
      end
      #logger.debug @message 
    else
      @message = "登入失敗"
      #logger.debug @message 
    end

    respond_to do |format|
      format.js {
        flash[:notice] = @message
        render :template => 'create.js.erb'
      }
    end
  end

  def destroy
    cookies.delete :user_id if cookies[:user_id]
    
    if cookies[:remember_token]
      LoginToken.find_by_token(cookies[:remember_token]).update(:token => nil)
      cookies.delete :remember_token
    end

    reset_session
    @message = '您已經登出！'
    flash[:notice] = @message
    
    redirect_to login_path
  end

end
