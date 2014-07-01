class ChangeLimitForTicketsReference < ActiveRecord::Migration
  def up
    change_column :tickets, :reference, :string, limit: 20
  end

  def down
    change_column :tickets, :reference, :string, limit: 15
  end
end
