class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.timestamps null: false
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :phone
      t.string :avatar
      t.references :user, foreign_key: true
    end
  end
end
