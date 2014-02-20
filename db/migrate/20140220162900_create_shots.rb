class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.string :name
      t.integer :comedian_id

      t.timestamps
    end
  end
end
