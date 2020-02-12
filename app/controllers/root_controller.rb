class RootController < ApplicationController
  def index
    @gossips = Gossip.all
    if @success
      @success
    end
  end
end
