class AddColumnsToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :image_path, :string
    add_column :albums, :image_name, :string
    add_column :albums, :client_modified_date, :date
    add_column :albums, :tags, :string, array: true, default: []
  end
end
