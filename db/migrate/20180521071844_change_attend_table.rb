class ChangeAttendTable < ActiveRecord::Migration[5.1]
  def change
    remove_reference :attends, :classes, index: true, foreign_key: true
    remove_reference :attends, :student, index: true, foreign_key: true
    add_column :attends, :classes_id, :integer
    add_column :attends, :student_id, :integer

  end
end
