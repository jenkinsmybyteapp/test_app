class Staff::DashboardController < Staff::BaseController

  def index
    @open_tickets = Ticket.includes(:department).open
    @hold_tickets = Ticket.includes(:department).hold
    @closed_tickets = Ticket.includes(:department).closed
  end

end
