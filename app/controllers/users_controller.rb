class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      logger.debug "Signup success"
      return render :json => {:success => true, :msg => ["註冊成功."]}
    else
      logger.debug "Signup error"
      return render :json => {:success => false, :msg => ["註冊失敗"]}
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :password)
  end
end
