class AddStatusReferenceToTickets < ActiveRecord::Migration
  def up
    add_column :tickets, :status_id, :integer
  end

  def down
    remove_columnt :tickets, :status_id
  end
end
