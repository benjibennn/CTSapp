class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.timestamps null: false
      t.string :scores
      t.references :classes, foreign_key: true
    end
  end
end