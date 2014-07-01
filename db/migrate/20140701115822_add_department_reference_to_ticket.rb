class AddDepartmentReferenceToTicket < ActiveRecord::Migration
  def up
    add_column :tickets, :department_id, :integer
  end

  def down
    remove_columnt :tickets, :department_id
  end
end
