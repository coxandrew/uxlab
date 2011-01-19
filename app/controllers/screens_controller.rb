class ScreensController < ApplicationController
  def new
    @flow = Flow.find(params[:flow_id])
    @project = @flow.project
    @screen = @flow.screens.build
  end

  def show
    @flow = Flow.find(params[:flow_id])
    @project = @flow.project
  end

  # POST /projects
  # POST /projects.xml
  def create
    @screen = Screen.new(params[:screen])

    if @screen.save
      redirect_to([@screen.flow.project, @screen.flow], :notice => 'Screen was successfully created.')
    else
      render :action => "new"
    end
  end

end
