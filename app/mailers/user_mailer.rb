class UserMailer < ActionMailer::Base
  default from: "no-replay@mail.com"

  def new_ticket(ticket)
    @ticket = ticket
    mail(to: @ticket.email, subject: 'You have a new ticket')
  end

  def new_reply(ticket)
    @ticket = ticket
    mail(to: @ticket.email, subject: 'You have a new reply for your ticket')
  end
end
