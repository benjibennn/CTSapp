class ChangeGradesTable < ActiveRecord::Migration[5.1]
  def change
    remove_reference :grades, :classes, index: true, foreign_key: true
    add_column :grades, :classes_id, :integer
  end
end
