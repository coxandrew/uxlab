class FeaturesController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :feature, :through => :project

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
end
