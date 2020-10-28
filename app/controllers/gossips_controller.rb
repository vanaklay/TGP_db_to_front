class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end
    
  def new
    @gossip = Gossip.new
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

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      flash[:notice] = "Gossip updated in DB"
      redirect_to gossip_path(@gossip.id)
    else
      flash.now[:alert] = "We cannot updated this gossip for this reason(s) :"
      render :edit
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      puts "destroy ok"
      redirect_to gossips_path 
    else 
      puts "destroy errors"
    end
  end

  private
  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end
end
