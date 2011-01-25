class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :current_project
  helper_method :user_projects

  before_filter :login_required

  private

  def current_user
    @current_user ||= User.find(session[:username]) if session[:username]
  end

  def current_project
    # TODO: Get the current controller and action in a cleaner way?
    id = (params[:controller] == "projects") ? :id : :project_id
    Project.find(params[id]) if params[id]
  end

  def user_projects
    # TODO: Get only projects that current_user can see
    @user_projects ||= Project.all
  end

  def login_required
    if current_user.nil?
      session[:return_to] = request.fullpath
      redirect_to sessions_new_path, :alert => "You must first log in before accessing this page"
    end
  end

  def redirect_back_or_default(default = root_path)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
