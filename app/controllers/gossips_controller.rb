class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create]

  def index
    @gossips = Gossip.all
  end
    
  def new
    @gossip = Gossip.new
    @tags = Tag.all
  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content])
    @gossip.user = User.find_by(id: session[:user_id])
    JoinTableTagGossip.create(gossip: @gossip, tag: Tag.find_by(id: params[:tag]))
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
    @user = User.all.sample
    @comment = Comment.new
    @comment.gossip_id = @gossip.id
    @comment.user_id = @user.id
    
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
  def authenticate_user
    unless current_user
      flash[:alert] = "You need to login in order to see all gossips !"
      redirect_to new_session_path
    end
  end
end
