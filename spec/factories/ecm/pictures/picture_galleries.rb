FactoryGirl.define do
  factory :ecm_pictures_picture_gallery, :class => Ecm::Pictures::PictureGallery do
    sequence(:name) { |n| "Picture gallery ##{n}" }
   
    factory :ecm_pictures_picture_gallery_with_pictures do |picture_gallery|
      3.times do
        picture_gallery.after_create { |pg| Factory.create(:ecm_pictures_picture, :picture_gallery => pg) }
      end
      picture_gallery.pictures_count 3
    end
  end
end
