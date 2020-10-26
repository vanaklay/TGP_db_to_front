class IndexController < ApplicationController
    
  def home
    @gossips = Gossip.all
  end

  def contact
  end

  def team
  end

  def welcome
  end

  def user
    @user = User.all.find_by(id:params[:id])
  end

  def gossip
    @gossip = Gossip.all.find_by(id:params[:id])
  end

end
