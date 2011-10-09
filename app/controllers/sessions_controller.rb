class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to room_path(Room.where(:name => 'Ein langer dunkler Flur').first.id)
    else
      redirect_to login_url, :notice => I18n.translate(:invalid_user_password_combination)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => I18n.translate(:logged_out)
  end

end
