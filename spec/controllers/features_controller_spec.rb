require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe FeaturesController do
  def mock_feature(stubs={})
    @mock_feature ||= mock_model(Feature, stubs).as_null_object
  end

  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs).as_null_object
  end

  before(:each) do
    controller.stub!(:current_user).and_return(mock_model(User))
  end

  describe "GET show" do
    it "assigns the requested feature as @feature" do
      Project.stub(:find).with("1") { mock_project }
      Feature.stub(:find).with("37") { mock_feature }
      Feature.should_receive(:find).with("37")

      get :show, :project_id => "1", :id => "37"
      assigns(:feature).should be(mock_feature)
    end
  end

  describe "GET new" do
    it "assigns a new feature as @feature" do
      Project.stub(:find).with("37") { mock_project }
      feature_proxy = mock('feature association proxy', :build => mock_feature)
      mock_project.stub(:features).and_return(feature_proxy)
      feature_proxy.stub(:select)

      get :new, :project_id => "37"
      assigns(:project).should be(mock_project)
      assigns(:feature).should be(mock_feature)
    end
  end

  describe "GET edit" do
    it "assigns the requested feature as @feature" do
      Project.stub(:find).with("1") { mock_project }
      Feature.stub(:find).with("37") { mock_feature }
      Feature.should_receive(:find).with("37")

      get :edit, :project_id => "1", :id => "37"
      assigns(:feature).should be(mock_feature)
    end
  end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "assigns a newly created feature as @feature" do
  #       Feature.stub(:new).with({'these' => 'params'}) { mock_feature(:save => true) }
  #       post :create, :feature => {'these' => 'params'}
  #       assigns(:feature).should be(mock_feature)
  #     end
  #
  #     it "redirects to the created feature" do
  #       Feature.stub(:new) { mock_feature(:save => true) }
  #       post :create, :feature => {}
  #       response.should redirect_to(feature_url(mock_feature))
  #     end
  #   end
  #
  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved feature as @feature" do
  #       Feature.stub(:new).with({'these' => 'params'}) { mock_feature(:save => false) }
  #       post :create, :feature => {'these' => 'params'}
  #       assigns(:feature).should be(mock_feature)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       Feature.stub(:new) { mock_feature(:save => false) }
  #       post :create, :feature => {}
  #       response.should render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested feature" do
  #       Feature.stub(:find).with("37") { mock_feature }
  #       mock_feature.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :feature => {'these' => 'params'}
  #     end
  #
  #     it "assigns the requested feature as @feature" do
  #       Feature.stub(:find) { mock_feature(:update_attributes => true) }
  #       put :update, :id => "1"
  #       assigns(:feature).should be(mock_feature)
  #     end
  #
  #     it "redirects to the feature" do
  #       Feature.stub(:find) { mock_feature(:update_attributes => true) }
  #       put :update, :id => "1"
  #       response.should redirect_to(feature_url(mock_feature))
  #     end
  #   end
  #
  #   describe "with invalid params" do
  #     it "assigns the feature as @feature" do
  #       Feature.stub(:find) { mock_feature(:update_attributes => false) }
  #       put :update, :id => "1"
  #       assigns(:feature).should be(mock_feature)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       Feature.stub(:find) { mock_feature(:update_attributes => false) }
  #       put :update, :id => "1"
  #       response.should render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE destroy" do
  #   it "destroys the requested feature" do
  #     Feature.stub(:find).with("37") { mock_feature }
  #     mock_feature.should_receive(:destroy)
  #     delete :destroy, :id => "37"
  #   end
  #
  #   it "redirects to the features list" do
  #     Feature.stub(:find) { mock_feature }
  #     delete :destroy, :id => "1"
  #     response.should redirect_to(features_url)
  #   end
  # end

end
