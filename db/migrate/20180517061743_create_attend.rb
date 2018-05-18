class CreateAttend < ActiveRecord::Migration[5.1]
  def change
    create_table :attends do |t|
      t.timestamps null: false
      t.datetime :date
      t.boolean :present, default: false
      t.references :classes, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
