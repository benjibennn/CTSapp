class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.timestamps null: false
      t.string :subject_name
      t.string :level
      t.time :time
      t.integer :price
      t.references :user, foreign_key: true
    end
  end
end