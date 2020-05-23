class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :last_access_token
      
      t.timestamps
    end
  end
end
