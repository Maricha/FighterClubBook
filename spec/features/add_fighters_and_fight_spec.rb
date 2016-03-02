require 'rails_helper'
RSpec.feature "add books and auto fight" do
  scenario "allow add two books and go fight" do

    visit new_skill_path
  		fill_in "Name", with: "Read"
  		fill_in "Level", with: "5"
  		click_on("Add your skill")

  	visit new_skill_path
  		fill_in "Name", with: "Super font"
  		fill_in "Level", with: "2"
  		click_on("Add your skill")

  	visit new_skill_path
  		fill_in "Name", with: "Rock"
  		fill_in "Level", with: "3"
  		click_on("Add your skill")

  	visit new_book_path
  		fill_in "Name", with: "Wesele"
  		fill_in "SpecialName", with: "dramat"
  		fill_in "Description", with: "To jest dramat"
  		page.attach_file("Avatar", Rails.root + 'app/assets/images/2.jpg')
  		click_on("Add your book fighter")


  	visit new_book_path
  		fill_in "Title", with: "Tyrok"
  		fill_in "SpecialName", with: "Rork"
  		fill_in "Description", with: "Good book"
  		click_on("Add your book fighter")




	end
end
