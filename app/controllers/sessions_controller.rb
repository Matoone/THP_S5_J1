class SessionsController < ApplicationController
  def new
    
  end

  def create
    # user_data = params.permit(:email, :password)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "#"*60
      flash[:success] = "Vous êtes bien identifié."
      redirect_to gossips_path
    else
      flash[:alert] = "Mauvais login / mot de passe."
      redirect_to new_session_path
      # render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Vous êtes déconnecté."
    redirect_to gossips_path
  end
end
