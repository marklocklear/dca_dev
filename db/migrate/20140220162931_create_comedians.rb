class CreateComedians < ActiveRecord::Migration
  def change
    create_table :comedians do |t|
      t.string :name
      t.string :twitter

      t.timestamps
    end
  end
end
