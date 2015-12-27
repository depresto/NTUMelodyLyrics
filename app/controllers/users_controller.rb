class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      logger.debug "Signup success"
      return render :json => {:success => true}
    else
      logger.debug "Signup error"
      return render :status => 400, :json => {:msg => ["Signup failed."]}
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :password)
  end
end
