class SessionsController < ApplicationController
  layout "sessions"
  skip_before_filter :login_required, :except => [:destroy]

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:username] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_back_or_default
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => "new"
    end
  end

  def destroy
    session[:username] = nil
    redirect_to sessions_new_path, :notice => "You have been logged out."
  end

end
