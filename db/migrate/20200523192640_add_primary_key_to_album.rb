class AddPrimaryKeyToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :image_id, :string
    add_index :albums, :image_id, unique: true
  end
end
