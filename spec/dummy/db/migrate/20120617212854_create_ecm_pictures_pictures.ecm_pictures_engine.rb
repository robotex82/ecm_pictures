# This migration comes from ecm_pictures_engine (originally 2)
class CreateEcmPicturesPictures < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_pictures do |t|
      t.references :picture_gallery
      t.integer :position
      t.string :name
      t.text :description
      
      # paperclip
      t.attachment :image
      
      # friendly_id
      t.string :slug

      t.timestamps
    end
  end
end
