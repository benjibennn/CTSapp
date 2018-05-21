class AddRelationToAttend < ActiveRecord::Migration[5.1]
  def change
    add_reference :attends, :subject
  end
end
