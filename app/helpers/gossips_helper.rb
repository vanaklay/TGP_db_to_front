module GossipsHelper
  def tag?(gossip)
    if gossip.tags.length > 0
      return true
    else 
      return false
    end
  end
end
