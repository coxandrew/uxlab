require 'ap'

class FlowsController < ApplicationController
  before_filter :get_project, :only => [:show, :new, :create, :edit]
  before_filter :get_feature, :only => [:show, :new, :create, :edit]

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

    respond_to do |format|
      if @flow.update_attributes(params[:flow])
        format.html { redirect_to(@flow.project, :notice => 'Flow was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flows/1
  # DELETE /flows/1.xml
  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy

    respond_to do |format|
      format.html { redirect_to(flows_url) }
      format.xml  { head :ok }
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
