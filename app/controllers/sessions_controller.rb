class SessionsController < ApplicationController
  def new
    
  end

  def create
    # user_data = params.permit(:email, :password)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "#"*60
      flash[:notice] = "Vous êtes bien identifié."
      redirect_to gossips_path
    else
      puts "Ca marche pas"
      flash.now[:notice] = "Mauvaise combinaison de password / mot de passe."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Vous êtes déconnecté."
    redirect_to gossips_path
  end
end
