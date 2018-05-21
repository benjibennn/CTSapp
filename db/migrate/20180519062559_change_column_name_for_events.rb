class ChangeColumnNameForEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :subject_name, :title
    rename_column :events, :level, :description
  end
end
