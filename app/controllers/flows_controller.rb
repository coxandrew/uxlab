require 'ap'

class FlowsController < ApplicationController
  before_filter :get_project, :only => [:show, :new, :create, :update, :edit]
  before_filter :get_feature, :only => [:show, :new, :create, :update, :edit]

  # GET /flows/1
  # GET /flows/1.xml
  def show
    @flow = Flow.find(params[:id])
  end

  # GET /flows/new
  # GET /flows/new.xml
  def new
    @flow = @feature.flows.build
  end

  # GET /flows/1/edit
  def edit
    @flow = Flow.find(params[:id])
  end

  # POST /flows
  # POST /flows.xml
  def create
    @flow = Flow.new(params[:flow])

    if @flow.save
      redirect_to([@project, @feature], :notice => 'Flow was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /flows/1
  # PUT /flows/1.xml
  def update
    @flow = Flow.find(params[:id])

    if @flow.update_attributes(params[:flow])
      redirect_to([@project, @feature], :notice => 'Flow was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /flows/1
  # DELETE /flows/1.xml
  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy

    redirect_to(flows_url)
  end

  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_feature
    @feature = Feature.find(params[:feature_id])
  end
end
