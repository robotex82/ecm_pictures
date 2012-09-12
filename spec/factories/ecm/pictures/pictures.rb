FactoryGirl.define do
  factory :ecm_pictures_picture, :class => Ecm::Pictures::Picture do
    image File.open(File.join(::Rails.root, 'spec/files', 'ecm/pictures/pictures', 'example.jpg'))
  end
end
