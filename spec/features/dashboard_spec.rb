require 'rails_helper'

feature ['Dashboard'], js: true do
  let!(:staff) { create :user }
  let!(:ticket) { create :ticket }
  let!(:status) { create :status, name: 'Cancelled' }

  background do
    html_signin(staff)
    visit dashboard_index_path
  end

  scenario 'redirects to index on sign in' do
    expect(current_path).to be_eql(dashboard_index_path)
    expect(page).to have_content('TICKETS LIST')
    expect(page).to have_content(ticket.reference)
  end

  scenario 'replies to patient ticket' do
    click_link 'reply'
    wait_for_ajax
    expect(page).to have_content('Reply to user')
    fill_in :staff_reply, with: 'Sample reply'
    select 'Cancelled', from: 'status'
    select staff.email, from: 'staff'
    click_button 'Send'
    wait_for_ajax
    expect(ActionMailer::Base.deliveries.count).to be_eql(1)
    ticket.reload
    expect(ticket.status.name).to be_eql('Cancelled')
    expect(ticket.user).to be_eql(staff)
    visit ticket_path(ticket)
    expect(page).to have_content('Sample reply')
  end
end
