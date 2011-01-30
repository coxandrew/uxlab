class ScreensController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :feature
  load_and_authorize_resource :flow
  load_and_authorize_resource :screen, :through => :flow

  before_filter :get_features, :only => [:show, :new]

  def new
    @flow = Flow.find(params[:flow_id])
    @screen = @flow.screens.build
  end

  def show
    @screen = Screen.find(params[:id])
  end

  def create
    @screen = Screen.new(params[:screen])

    if @screen.save
      redirect_to([@project, @feature, @screen.flow],
        :notice => 'Screen was successfully created.')
    else
      render :action => "new"
    end
  end

  def destroy
    @screen = Screen.find(params[:id])
    flow = @screen.flow
    @screen.destroy

    redirect_to([@project, @feature, flow])
  end
end
