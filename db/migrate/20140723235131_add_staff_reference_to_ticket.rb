class AddStaffReferenceToTicket < ActiveRecord::Migration
  def up
    add_column :tickets, :user_id, :integer
  end

  def down
    remove_column :tickets, :user_id
  end
end
