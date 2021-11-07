class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      remember(user)
      redirect_to root_path
    else
      flash.now[:danger] = '@mail/password invalide !'
      render 'new'
    end
  end

  def destroy
    log_out(current_user)
  end

end
