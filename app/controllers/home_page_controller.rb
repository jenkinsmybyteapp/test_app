class HomePageController < ApplicationController
  def index
    @ticket = Ticket.new
  end
end
