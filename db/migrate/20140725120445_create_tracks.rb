class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.boolean :status
      t.boolean :staff
      t.boolean :reply
      t.references :ticket

      t.timestamps
    end
  end
end
