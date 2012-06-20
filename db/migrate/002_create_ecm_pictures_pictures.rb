class CreateEcmPicturesPictures < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_pictures do |t|
      t.string :name
      t.text :description
      
      # acts as list
      t.integer :position
      
      # friendly id
      t.string :slug
      
      # paperclip
      # t.attachment :image
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.timestamp :image_updated_at
      t.string :image_fingerprint
      
      # references
      t.references :picture_gallery

      t.timestamps
    end
  end
end
