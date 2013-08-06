class CreateEcmPicturesAttachedPictures < ActiveRecord::Migration
  def change
    create_table :ecm_pictures_attached_pictures do |t|
      t.references :ecm_pictures_picture
      t.references :pictureable, :polymorphic => true
      t.timestamps
    end
  end
end

