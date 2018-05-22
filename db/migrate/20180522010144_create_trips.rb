class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
