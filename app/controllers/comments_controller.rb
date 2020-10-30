class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new]
  def create
    @user = User.find_by(id: session[:user_id])
    @comment = Comment.new(post_params)
    @comment.gossip_id = params[:gossip_id]
    @comment.user_id = @user.id

    if @comment.save
      flash[:notice] = "New comment Save in DB"
      redirect_to gossip_path(@comment.gossip_id)
    else
      puts @comment.errors.messages
      puts "error comments"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      flash[:notice] = "Comments updated in DB"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash.now[:alert] = "We cannot updated this comments for this reason(s) :"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment deleted in DB"
      redirect_to gossip_path(params[:gossip_id]) 
    else 
      flash.now[:alert] = "We cannot deleted this comment for this reason(s) :"
      render :edit
    end
  end

  private
  def post_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:alert] = "You need to login in order to see all gossips !"
      redirect_to new_session_path
    end
  end
  
end
