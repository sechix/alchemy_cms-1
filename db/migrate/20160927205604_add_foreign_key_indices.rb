class AddForeignKeyIndices < ActiveRecord::Migration
  def change
    change_column_null :alchemy_cells, :page_id, false, 0
    change_column_null :alchemy_contents, :element_id, false, 0
    change_column_null :alchemy_contents, :essence_id, false, 0
    change_column_null :alchemy_contents, :essence_type, false, 'Alchemy::EssenceText'
    change_column_null :alchemy_elements, :page_id, false, 0

    add_index :alchemy_cells, :page_id
    add_index :alchemy_contents, [:essence_id, :essence_type], unique: true
    add_index :alchemy_elements, :cell_id
    add_index :alchemy_essence_files, :attachment_id
    add_index :alchemy_essence_pictures, :picture_id
  end
end
