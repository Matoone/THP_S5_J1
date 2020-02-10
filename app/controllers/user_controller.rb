class UserController < ApplicationController
  def display
    @id = params["id"]
    @user = User.find(@id)
  end
end
