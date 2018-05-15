class CreateAttendance < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance do |t|
      t.timestamps null: false
      t.boolean :present
      t.references :classes, foreign_key: true
    end
  end
end