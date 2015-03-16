require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario  "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
      sign_up_as_test_user
    end

    it "should username on the homepage after signup" do

      expect(page).to have_content "testusername"
    end
  end
end

feature "logging in" do

  scenario  "has a sign in page" do
    visit new_session_url
    expect(page).to have_content "Sign In"
  end

  feature "Signing in" do
    before(:each) do
      sign_up_as_test_user
    end

    it "displays username on the homepage" do
        expect(page).to have_content "testusername"
    end

    it "should redirect to signin page on failure" do
      log_out
      sign_in("dfafad")
      expect(page).to have_content "Sign In"
    end

  end
end

feature "home page" do
  scenario "links to users page" do

    sign_up("gizmo")
    sign_up("cj")
    click_on "cj"
    expect(page).to have_content "cj"
  end

  scenario "new goal button if logged in"
end

feature "logging out" do

  scenario "begins with logged out state" do
    visit users_url
    expect(page).to have_content "Sign In"
  end

  scenario "doesn't show username on the homepage after logout" do
    sign_up("gizmo")
    click_on "Sign Out"
    expect(page).to have_content "Sign In"
  end

end
