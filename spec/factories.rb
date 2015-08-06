# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |u|
		u.name	"Example User"
		u.password "foobar"
		u.password_confirmation "foobar"
		u.email "example007@railstutorial.org"
end

Factory.sequence :email do |n| 
	"person-#{n}@example.com"
end
