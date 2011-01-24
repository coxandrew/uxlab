require 'spec_helper'

describe "features/edit.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project))
    @feature = assign(:feature, stub_model(Feature))
  end

  it "renders the edit feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_feature_path(@project, @feature), :method => "post" do
    end
  end
end
