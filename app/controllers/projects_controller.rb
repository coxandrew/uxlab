class ProjectsController < ApplicationController
  load_and_authorize_resource

  before_filter :get_features, :only => [:show]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    if @project.save
      current_user.add_role_to_project(Role.find_by_name("owner"), @project)
      redirect_to(@project, :notice => 'Project was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to(root_path, :notice => 'Project was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "#{@project.name} was successfully deleted."

    redirect_to(root_path)
  end
end
