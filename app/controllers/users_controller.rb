class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    puts "$" *100
    puts @user.id
  end
end
