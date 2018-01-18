class AddLocationToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :location, :string
  end
end
