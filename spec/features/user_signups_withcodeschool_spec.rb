require "rails_helper"
require 'capybara/poltergeist'

feature "http://go.codeschool.com/tgEpSg" do
	scenario "http://go.codeschool.com/tg |" do

		(1..30).each do |n|
			Capybara.javascript_driver = :poltergeist
			# visit "https://www.codeschool.com/users/sign_up"
			# fill_in "registration_email", with: "ankur#{n}@cognitiveclouds.com"
			# fill_in "registration_username", with: "ankurcc#{n}"
			# fill_in "registration_password",with: "akk322"
			# click_button "Create Free Account"
			# visit "http://go.codeschool.com/tgEpSg"
			# click_link "Sign Out"
	  end
	end
end