class LikesController < ApplicationController

  def create
    Like.create(user: User.find_by(id: params[:user_id]), likeable: Gossip.find_by(id: params[:gossip_id]))
    redirect_to gossip_path(id: params[:gossip_id])
  end

end
