class ProjectsController < ApplicationController
  load_and_authorize_resource

  before_filter :get_features, :only => [:show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project].merge(
      :owner_id => current_user.id)
    )
    if @project.save
      redirect_to(@project, :notice => 'Project was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to(@project, :notice => 'Project was successfully updated.')
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
