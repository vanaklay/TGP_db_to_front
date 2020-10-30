class LikesController < ApplicationController
  before_action :find_gossip
  before_action :find_like, only: [:destroy]
  def create
    if already_liked?
      flash[:alert] = "You can't like more than once"
    else
      @gossip.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: gossips_path)
  end

  def destroy
    if !(already_liked?)
      flash[:alert] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_back(fallback_location: gossips_path)
  end
  private
  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end
  def already_liked?
    Like.where(user_id: current_user.id, gossip_id:
    params[:gossip_id]).exists?
  end
  def find_like
    @like = @gossip.likes.find(params[:id])
 end
end
