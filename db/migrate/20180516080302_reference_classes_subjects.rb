class ReferenceClassesSubjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :classes, :subject, foreign_key: true
  end
end
