class AddScreenshotColumnsToTickets < ActiveRecord::Migration
  def up
    add_attachment :tickets, :screenshot
  end

  def down
    remove_attachment :tickets, :screenshot
  end
end
