class GossipsController < ApplicationController
  def new
    # obligé d'instancier un gossip vide ? 
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.all.sample)
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(id: 21))

    if @gossip.save
      flash[:notice] = "New gossip Save in DB"
      redirect_to root_path 
    else
      puts "$" * 30
      puts "error message"
      puts "$" * 30
      render :new
    end
  end
end
