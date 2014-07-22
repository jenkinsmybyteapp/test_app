require 'rails_helper'

describe Ticket do
  let!(:ticket) { create :ticket }

  it 'generates correct reference' do
    expect(ticket.reference).to match(/\w{3}-\w{3}-\w{3}-\w{3}-\w{3}/)
  end
end
