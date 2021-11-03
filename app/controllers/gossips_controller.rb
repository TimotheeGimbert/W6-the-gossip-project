class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])    
  end

  def new
     @gossip = Gossip.new
  end

  def create
    puts '$'*60
    puts params

    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.first)
    if @gossip.save 
      puts "yyyyyyyyyyy" *10
      redirect_to ('/')
    else
      puts "nnnnn"*20
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update

  end

  def destroy
   
  end

end
