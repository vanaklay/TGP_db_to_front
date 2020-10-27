class GossipsController < ApplicationController
  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(id: 21))

    if @gossip.save
      flash[:notice] = "New gossip Save in DB"
      redirect_to root_path 
    else
      flash.now[:alert] = "We cannot create your gossip for this reason(s) :"
      render :new
    end
  end
end
