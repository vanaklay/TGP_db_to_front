module GossipsHelper
  def tag?(gossip)
    gossip.tags.length > 0 ? true : false
  end

  def gossips?(user)
    user.gossips.length > 0 ? true : false
  end
end
