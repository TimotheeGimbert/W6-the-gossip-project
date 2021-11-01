class PageController < ApplicationController
  
  def index
    @gossips = Gossip.all
  end

  def team

  end


  def contact

  end

  def welcome
    puts "$" * 60
    puts params[:input]
    puts "$" * 60
  end

end
