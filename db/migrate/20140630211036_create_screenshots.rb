class CreateScreenshots < ActiveRecord::Migration
  def up
    create_table :screenshots do |t|
      t.references :tickets
      t.timestamps
    end
    add_attachment :screenshots, :image
  end

  def down
    drop_table :screenshots
  end
end
