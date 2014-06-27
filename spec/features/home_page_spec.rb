require 'rails_helper'

feature ['Home page'], js: true do
  scenario 'Visit home page' do
    visit root_path
    expect(page).to have_content('Welcome to HelpDesk System!')
    expect(page).to have_css(('textarea[name="ticket[body]"]'))
  end
end
