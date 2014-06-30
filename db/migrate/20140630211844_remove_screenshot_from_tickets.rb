class RemoveScreenshotFromTickets < ActiveRecord::Migration
  def up
    remove_attachment :tickets, :screenshot
  end

  def down
    add_attachment :tickets, :screenshot
  end

end
