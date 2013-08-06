FactoryGirl.define do
  factory :ecm_pictures_attached_picture, :class => Ecm::Pictures::AttachedPicture do
    picture :factory => :ecm_pictures_picture
    pictureable :factory => :post
  end
end
