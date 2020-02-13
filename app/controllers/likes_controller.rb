class LikesController < ApplicationController
  def new
    
    @gossip_id = params[:id]
    gossip = Gossip.find(@gossip_id)
    if gossip.likes.any? { |like| like.user == current_user}
      redirect_to gossip_path(@gossip_id)
      return
    end
    like = Like.new(user: current_user, writable: gossip)
    if like.save
      redirect_to gossip_path(@gossip_id)
    else
      redirect_to gossip_path(@gossip_id)
    end
  end

  def create
   
  end

  def destroy
    
    like_to_destroy = Like.find(params[:id])
    gossip_id = like_to_destroy.writable.id
    like_to_destroy.destroy
    redirect_to gossip_path(gossip_id)
  end
end
