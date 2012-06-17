# This migration comes from ecm_pictures_engine (originally 1)
class CreateEcmPicturesPictureGalleries < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_picture_galleries do |t|
      t.integer :position
      t.string :name
      t.text :description
      t.integer :pictures_count
      
      # friendly_id
      t.string :slug

      t.timestamps
    end
  end
end
