require 'rails_helper'

RSpec.feature 'User Signs in', type: :feature do
  background { visit new_user_session_path }
  scenario 'Page should have a login form' do
    expect(page.has_field?('Email Address')).to be true
    expect(page.has_field?('Password')).to be true
    expect(page.has_button?('Log in')).to be true
  end

  scenario 'Submit form without email and password' do
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Submit form with incorrect email and password' do
    within 'form' do
      fill_in 'Email Address', with: 'esi.ogagaoghene@yahoo.com'
      fill_in 'Password', with: 'oracle11'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Submit form with correct email and password' do
    @user = User.create(name: 'Esi Ogagaoghene', email: 'esi.ogagaoghene@yahoo.com', password: 'oracle',
                        confirmed_at: Time.now)
    within 'form' do
      fill_in 'Email Address', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'should enter a name and receive a greeting' do
    visit user_session_path
    expect(page).to have_content 'Log in'
  end

  scenario 'should show inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(user_session_path)
  end

  scenario 'is invalid with unregistered account' do
    visit user_session_path
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
