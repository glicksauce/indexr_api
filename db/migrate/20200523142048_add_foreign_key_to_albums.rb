class AddForeignKeyToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :dbx_user_id, :string
  end
end
