class CreateApplets < ActiveRecord::Migration[6.0]
  def change
    create_table :applets do |t|
      t.string :title
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
