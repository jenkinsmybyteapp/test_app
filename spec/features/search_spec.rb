require 'rails_helper'

feature ['Search'], js: true do
  let!(:staff) { create :user }
  let!(:first_ticket) { create :ticket, body: 'Hello World' }
  let!(:second_ticket) { create :ticket, body: 'Goodbye my darling' }
  let!(:third_ticket) { create :ticket, body: 'Goodbye and Hello' }


  background do
    html_signin(staff)
    visit dashboard_index_path
    click_link 'Search'
  end

  scenario 'finds ticket by reference' do
    fill_in 'search_reference', with: first_ticket.reference
    click_button 'Search'
    wait_for_ajax
    expect(page).to have_content(first_ticket.reference)
    expect(page).to have_no_content(second_ticket.reference)
  end

  scenario 'finds ticket by words' do
    fill_in 'search_word', with: 'Hello'
    click_button 'Search'
    wait_for_ajax
    expect(page).to have_content(first_ticket.reference)
    expect(page).to have_content(third_ticket.reference)
    expect(page).to have_no_content(second_ticket.reference)
  end
end
