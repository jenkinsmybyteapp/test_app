class Staff::SearchController < Staff::BaseController
  def create
    @ticket_by_reference = Ticket.where(reference: params[:search_reference])
    @tickets_by_words = Ticket.search(params[:search_word])
    @result = @ticket_by_reference + @tickets_by_words
    flash.now[:success] = 'Search is complete!'
  end
end
