class AddDayToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :day, :datetime
  end
end
