class AddIntercomIdToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :intercom_id, :string
  end
end
