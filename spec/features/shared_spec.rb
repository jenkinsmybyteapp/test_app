require 'rails_helper'

feature ['Shared functionality'], js: true do
  describe 'Flash messages block' do
    scenario 'Hides on click to close button' do
      visit root_path
      click_button 'Create Ticket'
      wait_for_ajax
      page.find('a[data-dismiss=alert]').click
      expect(page).to have_no_css('.flash-messages-block', visible: false)
    end
  end
end
