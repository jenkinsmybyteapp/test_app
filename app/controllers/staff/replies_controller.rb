class Staff::RepliesController < Staff::BaseController
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
    build_track(status, staff)
    if @ticket.update_attributes(attrs_hash)
      UserMailer.new_reply(@ticket).deliver
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

  def build_track(status, staff)
    @ticket.tracks.build(status: !!status,
                         staff: !!staff,
                         reply: params[:staff_reply].present?)
  end

end
