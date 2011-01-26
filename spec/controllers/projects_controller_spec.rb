require 'spec_helper'

describe ProjectsController do
  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs).as_null_object
  end

  before(:each) do
    controller.stub!(:current_user).and_return(mock_model(User))
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      Project.stub(:find).with("1") { mock_project }

      get :show, :id => "1"
      assigns(:project).should be(mock_project)
    end
  end
end