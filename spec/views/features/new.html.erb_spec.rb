require 'spec_helper'

describe "features/new.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project))
    assign(:feature, stub_model(Feature).as_new_record)
  end

  it "renders new feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_features_path(@project), :method => "post" do
    end
  end
end
