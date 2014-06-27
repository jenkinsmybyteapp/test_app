require 'rails_helper'

feature ['Home page'], js: true do
  background do
    visit root_path
  end

  scenario 'Visit home page' do
    expect(page).to have_content('Welcome to HelpDesk System!')
    expect(page).to have_css(('textarea[name="ticket[body]"]'))
  end
  describe 'Tickets submission' do
    scenario 'successfull' do
      fill_in 'Issue', with: 'Cannot understand this crazy world'
      click_button 'Create Ticket'
      wait_for_ajax
      expect(page).to have_content('Your ticket has been successfully submitted')
    end

    scenario 'with empty body' do
      click_button 'Create Ticket'
      wait_for_ajax
      expect(page).to have_content('Error! Please fill in some ticket text')
    end
  end
end
