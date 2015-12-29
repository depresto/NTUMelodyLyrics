class SessionsController < ApplicationController

  def create
  	@user = User.authenticate(params[:username], params[:password], params[:remember])
  	respond_to do |format|
	  	if @user
	  		session[:user_name] = @user['name']
	  		logger.debug "Login success"
  			return render :json => {:success => true, :redirect => main_path, :login_token => @user['login_token']}
	  	else
	  		logger.debug "Login error"
	  		return render :json => {:success => false, :msg => ["Login failed."]}
	  	end
  	end
  end

  def token
    @user = LoginToken.authenticate_token(params[:login_token])
    if @user
      session[:user_name] = @user['name']
      return render :json => {:success => true, :redirect => main_path}
    else
      logger.debug "Login error"
      return render :json => {:success => false, :msg => ["Login failed."]}
    end
  end

  def destroy
  end
end
