class RemoveColumnFromAlbum < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :img_src
  end
end
