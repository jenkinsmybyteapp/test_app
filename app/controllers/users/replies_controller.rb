class Users::RepliesController < ApplicationController
  def create
    @ticket = Ticket.where(reference: params[:ticket_id]).first
    @ticket.replies.build(body: params[:user_reply], user: nil)
    if @ticket.save
      flash.now[:success] = 'Reply was successfully created'
    else
      flash.now[:error] = @ticket.errors.full_messages.to_sentence
    end
  end
end
