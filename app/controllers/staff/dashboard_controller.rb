class Staff::DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @open_tickets = Ticket.open
    @hold_tickets = Ticket.hold
    @closed_tickets = Ticket.closed
  end

end
