class FlowsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :feature
  load_and_authorize_resource :flow, :through => :feature

  before_filter :get_features, :only => [:show, :new, :edit]

  def show
    @flow = Flow.find(params[:id])
  end

  def new
    @flow = @feature.flows.build
  end

  def edit
    @flow = Flow.find(params[:id])
  end

  def create
    @flow = Flow.new(params[:flow])

    if @flow.save
      redirect_to([@project, @feature], :notice => 'Flow was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @flow = Flow.find(params[:id])

    if @flow.update_attributes(params[:flow])
      redirect_to([@project, @feature], :notice => 'Flow was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy

    redirect_to(flows_url)
  end
end
