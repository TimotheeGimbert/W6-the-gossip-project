class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    puts '$' * 60
    if user && user.authenticate(params[:password])
      puts 'SESSIONTRUE' * 10
      log_in(user)
    else
      puts 'SESSIONFALSE' * 10
      flash.now[:danger] = 'Invalid user/pass combo !'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
  end

end
