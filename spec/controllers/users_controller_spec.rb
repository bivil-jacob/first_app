require 'spec_helper'


describe UsersController do
  integrate_views

  #Delete these examples and add some real ones
  


  describe "GET 'new'" do

    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_tag("title", /Sign up/)
    end

    it "should have a signup page at '/signup'" do
      get 'new'
      response.should render_template('users/new')
    end
  end

  describe "GET 'show'" do
    before(:each) do
    @user = Factory.create(:user)
  # Arrange for User.find(params[:id]) to find the right user. User.stub!(:find, @user.id).and_return(@user)
    end

    it "should be successful" do 
      get :show, :id => @user 
      response.should be_success
    end 
  end
end
