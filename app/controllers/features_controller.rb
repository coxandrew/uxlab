class FeaturesController < ApplicationController
  before_filter :get_project, :only => [:show, :new, :create, :edit]
  before_filter :get_feature, :only => [:show, :edit]
  before_filter :get_features, :only => [:show, :new, :edit]

  def new
    @feature = @project.features.build
  end

  def create
    @feature = Feature.new(params[:feature])

    if @feature.save
      redirect_to(@project, :notice => 'Feature was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @feature = Feature.find(params[:id])

    if @feature.update_attributes(params[:feature])
      redirect_to(@feature, :notice => 'Feature was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy

    redirect_to(features_url)
  end

  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_feature
    @feature = Feature.find(params[:id])
  end
end
