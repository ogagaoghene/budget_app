require 'rails_helper'

RSpec.feature 'User Signs in', type: :feature do
  it 'should enter a name and receive a greeting' do
    visit user_session_path
    expect(page).to have_content 'Log in'
  end

  it 'should show inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(user_session_path)
  end

  it 'is invalid with unregistered account' do
    visit user_session_path
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end