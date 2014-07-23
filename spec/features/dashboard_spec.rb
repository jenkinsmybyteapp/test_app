require 'rails_helper'

feature ['Dashboard'], js: true do
  let!(:staff) { create :user }

  background do
    html_signin(staff)
    visit dashboard_index_path
  end

  scenario 'redirects to index on sign in' do
    expect(current_path).to be_eql(dashboard_index_path)
    expect(page).to have_content('TICKETS LIST')
  end
end
