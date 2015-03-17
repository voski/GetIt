require 'spec_helper'
require 'rails_helper'

feature "Goals" do

  scenario "have create goal link in nav if logged in" do
    sign_up("gizmo")
    click_on("New Goal")
    expect(page).to have_content("Create Goal")
  end

  scenario "creates a new goal" do
    sign_up("gizmo")
    click_on("New Goal")
    create_goal("eat a cake")
    expect(page).to have_content("eat a cake")
  end

  feature "private goals are hidden" do

    before(:each) do
      sign_up("gizmo")
      click_on("New Goal")
      create_goal("my secret", "private")
      logout
      sign_up("markov")
    end

    scenario "on the user page" do
      visit(user_url(User.first))
      expect(page).to_not have_content("my secret")
    end

    scenario "through direct url" do
      visit(goal_url(Goal.first))
      expect(page).to_not have_content("my secret")
    end
  end

  feature "shows public goals" do

    before(:each) do
      sign_up("gizmo")
      click_on("New Goal")
      create_goal("my confession")
      logout
      sign_up("markov")
    end

    scenario "on user page" do
      visit(user_url(User.first))
      expect(page).to have_content("my confession")
    end

    scenario "on user page" do
      visit(goal_url(Goal.first))
      expect(page).to have_content("my confession")
    end

  end

  feature "editing" do
    before(:each) do
      sign_up("gizmo")
      click_on("New Goal")
      create_goal("my confession")
    end

    scenario "author can see edit button" do
      visit(user_url(User.first))
      expect(page).to have_content("Edit Goal")
    end

    scenario "edit successfuly updates" do
      click_on("Edit Goal")
      update_goal("my new confession")
      expect(page).to have_content("my new confession")
    end

    scenario "other users can not edit" do
      logout
      sign_up("markov")
      visit(user_url(User.first))
      expect(page).to_not have_content("Edit Goal")
    end

  end
end
