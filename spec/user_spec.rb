require 'spec_helper'

describe User do
  context "create" do
    it "succeeds with a valid username and password" do
      cox = User.new(
        :username => 'cox',
        :password => 'password',
        :password_confirmation => 'password')
      cox.save
      cox.errors.size.should == 0
    end

    it "fails with a password less than 4 characters" do
      cox = User.new(
        :username => 'cox',
        :password => 'foo',
        :password_confirmation => 'foo')
      cox.save
      cox.errors.size.should == 1
      cox.errors[:password].first.should match /minimum is 4 characters/
    end
  end

  context "authentication" do
    it "authenticates with a valid username and password" do
      User.create(
        :username => 'cox',
        :password => 'sausage',
        :password_confirmation => 'sausage')
      User.authenticate('cox', 'sausage').should be_a_kind_of User
    end
  end
end