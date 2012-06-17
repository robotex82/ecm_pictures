class CreateEcmPicturesPictures < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_pictures do |t|
      t.references :picture_gallery
      t.integer :position
      t.string :name
      t.text :description
      
      # paperclip
      t.attachment :image
      t.string :image_fingerprint
      
      # friendly_id
      t.string :slug

      t.timestamps
    end
  end
end
