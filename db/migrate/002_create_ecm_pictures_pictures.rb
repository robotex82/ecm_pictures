class CreateEcmPicturesPictures < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_pictures do |t|
      t.string :name
      t.text :description

      # associations
      t.references :picture_gallery
      
      # acts as list
      t.integer :position

      # acts as markup
      t.string :markup_language
      
      # friendly id
      t.string :slug
      
      # paperclip
      # t.attachment :image
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.timestamp :image_updated_at
      t.string :image_fingerprint

      t.timestamps
    end
  end
end
