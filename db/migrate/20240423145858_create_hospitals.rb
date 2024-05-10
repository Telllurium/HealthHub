class CreateHospitals < ActiveRecord::Migration[7.1]
  def change
    create_table :hospitals do |t|
      t.integer :rank
      t.string :institute
      t.integer :size
      t.integer :visibility
      t.integer :rich_files
      t.integer :scholar

      t.timestamps
    end
  end
end
