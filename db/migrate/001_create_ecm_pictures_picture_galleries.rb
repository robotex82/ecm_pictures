class CreateEcmPicturesPictureGalleries < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_picture_galleries do |t|
      t.string :name
      t.text :description
      t.boolean :link_images
      t.integer :pictures_count
      
      # acts as list
      t.integer :position
      
      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
