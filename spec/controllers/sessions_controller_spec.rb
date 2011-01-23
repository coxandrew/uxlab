require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    pending "figure out how to test this POST properly"

    it "logs a user in" do
      User.create(
        :username => 'cox',
        :password => 'sausage',
        :password_confirmation => 'sausage'
      )
      post :create, :username => 'cox', :password => 'sausage'
      response.should redirect_to(root_path)
    end
  end
end
