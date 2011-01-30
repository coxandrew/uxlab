require 'spec_helper'

describe "features/show.html.erb" do
  before(:each) do
    controller.stub!(:current_user).and_return(mock_model(User))
    @project = assign(:project, stub_model(Project))
    @feature = assign(:feature, stub_model(Feature))
  end

  it "renders" do
    render
  end
end
