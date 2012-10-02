class CreateEcmPicturesPictureGalleries < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_picture_galleries do |t|
      t.string :name
      t.text :description
      t.boolean :link_images

      # associations
      t.integer :pictures_count, :default => 0, :null => false
      
      # acts as list
      t.integer :position

      # acts as markup
      t.string :markup_language
      
      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
