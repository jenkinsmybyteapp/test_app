class Staff::RepliesController < ApplicationController
  respond_to :js

  def new
    @ticket = Ticket.where(reference: params[:ticket_id]).first
  end

  def create
  end

end
