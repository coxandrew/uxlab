require 'spec_helper'

describe "features/show.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project))
    @feature = assign(:feature, stub_model(Feature))
  end

  it "renders attributes in <p>" do
    render
  end
end
