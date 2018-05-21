class CreateClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :classes do |t|
      t.timestamps null: false
      t.references :students, foreign_key: true
      t.references :subjects, foreign_key: true
    end
  end
end
