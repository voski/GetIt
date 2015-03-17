require 'spec_helper'
require 'rails_helper'

feature "comments" do
  feature "add a new comment" do
    let(:saying) { Faker::Hacker.say_something_smart }
    before(:each) do
      sign_up("gizmo")
      click_on("New Goal")
      create_goal("my secret")
      logout
      sign_up("markov")
    end

    scenario "on a user" do
      visit user_url(User.first)
      fill_in("user_comment_form", :with => saying)
      click_button("Add Comment")
      expect(page).to have_content(saying)
    end

    scenario "on a goal" do
      visit goal_url(Goal.first)
      fill_in("goal_comment_form", :with => saying)
      click_button("Add Comment")
      expect(page).to have_content(saying)
    end

  end

  feature "delete comments" do

    before(:each) do
      sign_up("gizmo")
      click_on("New Goal")
      create_goal("my secret")
      logout

      sign_up("markov")
      visit user_url(User.first)
      fill_in("user_comment_form", :with => "you will never make it")
      click_button("Add Comment")
      logout

      sign_up("curie")
      visit user_url(User.first)
      fill_in("user_comment_form", :with => "you got dis")
      click_button("Add Comment")
      logout
    end

    scenario "owner of page or goal" do
      sign_in("gizmo")
      click_on("gizmo")
      expect(page).to have_button('delete', count: 2)
    end


    scenario "owner of comment" do
      sign_in("markov")
      click_on("gizmo")
      expect(page).to have_button('delete', count: 1)
    end

    scenario "non authorize users can not" do
      sign_up("newbie")
      click_on("gizmo")
      expect(page).to_not have_button('delete')
    end

    scenario "delete removes comment" do
      sign_in("markov")
      click_on("gizmo")
      click_on("delete")
      expect(page).to_not have_content("you will never make it")
    end
  end

  feature "edit comments"


end
