class Users::TicketsController < ApplicationController
  respond_to :js

  def create
    @ticket = Ticket.new(ticket_params)
    build_screenshot(@ticket)
    if @ticket.save
      UserMailer.new_ticket(@ticket).deliver
      flash[:success] = 'Your ticket has been successfully submitted'
      render 'create_success'
    else
      flash.now[:error] = %Q{The following errors prevent your ticket submission:
                             #{@ticket.errors.full_messages.join('<br/>')}}

      render 'create_error'
    end
  end

  def show
    @ticket = Ticket.where(:reference => params[:id]).first
    unless @ticket
      flash[:error] = 'Ticket not found'
      redirect_to root_url
    end
  end

  private

  def ticket_params
      params.require(:ticket).permit(:body, :screenshots, :email)
  end

  def build_screenshot(ticket)
    if params[:ticket][:screenshots]
      ticket.screenshots.build(image: params[:ticket][:screenshots].first)
    end
  end
end
