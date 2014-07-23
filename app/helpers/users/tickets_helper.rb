module Users::TicketsHelper
  def staff_assigned(ticket)
    ticket.user.try(:email) || 'unassigned'
  end
end
