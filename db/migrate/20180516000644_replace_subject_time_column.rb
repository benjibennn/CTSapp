class ReplaceSubjectTimeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :subjects, :time, :date
    add_column :subjects, :start_time, :datetime
    add_column :subjects, :end_time, :datetime
  end
end
