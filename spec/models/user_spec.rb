require 'spec_helper'

describe User do
  context "create" do
    it "succeeds with a valid username and password" do
      cox = User.new(
        :username => 'cox',
        :password => 'password',
        :password_confirmation => 'password')
      cox.save.should be_true
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

    it "fails if username is already taken" do
      andrew_cox = User.create(
        :username => 'cox',
        :password => 'password',
        :password_confirmation => 'password')
      anne_cox = User.create(
        :username => 'cox',
        :password => 'awesome',
        :password_confirmation => 'awesome')
      anne_cox.errors[:username].first.should match /has already been taken/
    end
  end

  context "authentication" do
    before(:each) do
      @username = 'cox'
      @password = 'sausage'
      @cox = User.create(
        :username => @username,
        :password => @password,
        :password_confirmation => @password)
    end

    it "authenticates with a valid username and password" do
      User.authenticate(@username, @password).should be_a_kind_of User
    end

    it "can determine a matching passsword" do
      @cox.matching_password?(@password).should be_true
    end

    it "can determine an unmatching passsword" do
      @cox.matching_password?("#{@password}_bogus").should be_false
    end
  end
end