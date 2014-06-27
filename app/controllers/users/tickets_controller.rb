class Users::TicketsController < ApplicationController
  respond_to :js

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:success] = 'Your ticket has been successfully submitted'
      render 'create_success'
    else
      flash.now[:error] = %Q{The following errors prevent your ticket submission:
                             #{@ticket.errors.full_messages.join('<br/>')}}

      render 'create_error'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:body)
  end
end
