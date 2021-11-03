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
      redirect_to ('/')
    else
      puts "GOSSIP CREATION ERROR" * 10
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(post_params)
    redirect_to root_path
  end

  def destroy
   
  end

end
