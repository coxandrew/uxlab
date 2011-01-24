class ScreensController < ApplicationController
  before_filter :get_project, :only => [:new, :show, :create]
  before_filter :get_feature, :only => [:new, :show, :create]

  def new
    @flow = Flow.find(params[:flow_id])
    @screen = @flow.screens.build
  end

  def show
    @flow = Flow.find(params[:flow_id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @screen = Screen.new(params[:screen])

    if @screen.save
      redirect_to([@project, @feature, @screen.flow],
        :notice => 'Screen was successfully created.')
    else
      render :action => "new"
    end
  end

  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_feature
    @feature = Feature.find(params[:feature_id])
  end
end
