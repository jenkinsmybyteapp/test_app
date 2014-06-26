require 'rails_helper'

feature ['Home page'], js: true do
  scenario 'Visit home page' do
    visit root_path
    expect(page).to have_content('Welcome to HelpDesc System!')
  end
end
