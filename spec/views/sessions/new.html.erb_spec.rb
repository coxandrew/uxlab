require 'spec_helper'

describe "sessions/new.html.erb" do
  it "displays the welcome message" do
    render
    rendered.should contain("Welcome to UX Lab!")
  end
end
