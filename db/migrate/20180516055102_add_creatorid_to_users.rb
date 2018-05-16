class AddCreatoridToUsers < ActiveRecord::Migration[5.1]
  def change 
    add_column :users, :creator_id, :integer
  end
end
