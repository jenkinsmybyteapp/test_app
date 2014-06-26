class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.text :body
      t.string :reference, limit: 15
      t.string :status, limit: 30

      t.timestamps
    end
  end
end
