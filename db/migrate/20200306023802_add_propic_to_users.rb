class AddPropicToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :propic, :string
  end
end
