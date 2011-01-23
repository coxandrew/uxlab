class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :login_required

  private

  def current_user
    @current_user ||= User.find(session[:username]) if session[:username]
  end

  def login_required
    if current_user.nil?
      redirect_to sessions_new_path, :alert => "You must first log in before accessing this page"
    end
  end
end
