require 'rails_helper'

feature ['Home page'], js: true do
  let!(:department) { create :department }
  let!(:status) { create :status }

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
      fill_in 'ticket_email', with: 'sample@example.com'
      select department.name, from: 'ticket_department_id'
      click_button 'Create Ticket'
      wait_for_ajax
      expect(page).to have_content('Your ticket has been successfully submitted')
    end

    scenario 'with empty body' do
      click_button 'Create Ticket'
      wait_for_ajax
      expect(page).to have_content('The following errors prevent your ticket submission')
    end
  end
end
