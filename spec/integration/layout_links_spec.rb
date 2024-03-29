require 'spec_helper'

describe "LayoutLinks" do
	it "should have a Home page at '/contact'" do
		get '/contact'
		response.should render_template('pages/contact')
	end
	it "should have a About page at '/about'" do
		get '/about'
		response.should render_template('pages/about')
	end
	it "should have a Home page at '/'" do
		get '/'
		response.should render_template('pages/home')
	end
	it "should have a help page at '/help'" do
		get '/help'
		response.should render_template('pages/help')
	end

	it "Should have right links on the layout" do
		visit root_path
		click_link "About"
		response.should render_template('pages/about')
		click_link "Home"
		response.should render_template('pages/home')
		click_link "Contact"
		response.should render_template('pages/contact')
		click_link "Help"
		response.should render_template('pages/help')
		visit root_path
		click_link "Sign up now!"
		response.should render_template('users/new')
	end

	describe "when not signed in" do
		it "should have a signin link" do
    		visit root_path
			response.should have_tag("a[href=?]", signin_path, "Sign in") 
		end
	end

	describe "when signed in" do
		before(:each) do
		@user = Factory(:user)
		visit signin_path
		fill_in :email, :with => @user.email 
		fill_in :password, :with => @user.password 
		click_button
		end

		it "should have a signout link" do
			visit root_path
			response.should have_tag("a[href=?]", signout_path, "Sign out")
		end
		it "should have a profile link" do
			visit root_path
			response.should have_tag("a[href=?]", user_path(@user), "Profile")
		end
	end
end
