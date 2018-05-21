class CreateClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :classes do |t|
      t.timestamps null: false
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end