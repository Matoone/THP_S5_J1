class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    
  end
  def show
    @id = params["id"]
    @gossip = Gossip.find(@id)
  end

  def new
    
  end

  def create
    title = params["title"]
    content = params["content"]
    anonymous_user = User.find_by(first_name: "anonymous")
    @gossip = Gossip.new(title: title, content: content, user: anonymous_user)

    if @gossip.save
      redirect_to gossips_path(success: true)
    else
      @errors = @gossip.errors
      render(new_gossip_path)
    end
  end
end
