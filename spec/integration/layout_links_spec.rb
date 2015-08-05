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

end
