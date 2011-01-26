require 'spec_helper'

describe User do
  context "create" do
    it "succeeds with a valid username and password" do
      leroy = User.new(
        :username => 'leroy',
        :password => 'password',
        :password_confirmation => 'password')
      leroy.save.should be_true
    end

    it "fails with a password less than 4 characters" do
      leroy = User.new(
        :username => 'leroy',
        :password => 'foo',
        :password_confirmation => 'foo')
      leroy.save
      leroy.errors.size.should == 1
      leroy.errors[:password].first.should match /minimum is 4 characters/
    end

    it "fails if username is already taken" do
      andrew_leroy = User.create(
        :username => 'leroy',
        :password => 'password',
        :password_confirmation => 'password')
      anne_leroy = User.create(
        :username => 'leroy',
        :password => 'awesome',
        :password_confirmation => 'awesome')
      anne_leroy.errors[:username].first.should match /has already been taken/
    end
  end

  context "authentication" do
    before(:each) do
      @username = 'leroy'
      @password = 'sausage'
      @leroy = User.create(
        :username => @username,
        :password => @password,
        :password_confirmation => @password)
    end

    it "authenticates with a valid username and password" do
      User.authenticate(@username, @password).should be_a_kind_of User
    end

    it "can determine a matching passsword" do
      @leroy.matching_password?(@password).should be_true
    end

    it "can determine an unmatching passsword" do
      @leroy.matching_password?("#{@password}_bogus").should be_false
    end
  end
end