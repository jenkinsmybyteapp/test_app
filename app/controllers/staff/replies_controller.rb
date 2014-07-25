class Staff::RepliesController < ApplicationController
  respond_to :js
  before_filter :find_ticket

  def new
    @staff = User.all
  end

  def create
    status = Status.where(name: params[:status]).first
    staff = User.where(email: params[:staff]).first
    attrs_hash = {}
    attrs_hash.merge!(status: status) if status
    attrs_hash.merge!(user: staff) if staff
    build_staff_reply if params[:staff_reply].present?
    if @ticket.update_attributes(attrs_hash)
      flash.now[:success] = 'Reply was successfully created'
      render :create_success
    else
      flash.now[:error] = @ticket.errors.full_messages.to_sentence
      render :create_error
    end
  end

  private

  def find_ticket
    @ticket = Ticket.where(reference: params[:ticket_id]).first
  end

  def build_staff_reply
    @ticket.replies.build(body: params[:staff_reply], user: current_user)
  end

end
