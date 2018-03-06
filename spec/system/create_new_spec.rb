require 'rails_helper'

# see spec/support/site_prism.rb

describe 'create new user account page', js: true do

  it 'it should create an user if all data is set' do
    @create_user_page = RegistrationObjects::CreateUserPage.new
    @create_user_page.load
    @create_user_page.wait_for_form_section

    expect(@create_user_page).to have_form_section
    expect(@create_user_page.form_section).to have_name

    @create_user_page.form_section.name.set "Ana"
    @create_user_page.form_section.full_name.set "Ana Full"
    @create_user_page.form_section.email.set "ana@foo.com"
    @create_user_page.form_section.password.set "secret"
    @create_user_page.form_section.password_confirmation.set "secret"
    @create_user_page.form_section.submit.click

    @timeline_page = TimelineObjects::TimelinePage.new

    expect(@timeline_page).to be_displayed

  end

  it 'it should not create an user if data is missing' do
    @create_user_page = RegistrationObjects::CreateUserPage.new
    @create_user_page.load
    @create_user_page.wait_for_form_section

    expect(@create_user_page).to have_form_section
    expect(@create_user_page.form_section).to have_name

    @create_user_page.form_section.name.set "Ana"
    @create_user_page.form_section.full_name.set "Ana Full"
    @create_user_page.form_section.email.set "ana@foo.com"
    @create_user_page.form_section.password.set "secret"
    @create_user_page.form_section.password_confirmation.set "secret"
    @create_user_page.form_section.submit.click

    @timeline_page = TimelineObjects::TimelinePage.new

    expect(@timeline_page).to be_displayed

  end

end
