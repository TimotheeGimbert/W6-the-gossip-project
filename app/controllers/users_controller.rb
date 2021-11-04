class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    city = City.first
    @user = User.new(name: params[:name], description: params[:description], city: city, email: params[:email], password: params[:password])
    if @user.save 
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = 'Invalid user parameters !'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
