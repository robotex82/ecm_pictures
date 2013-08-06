require 'spec_helper'

module Ecm::Pictures
  describe AttachedPicture do
    subject { FactoryGirl.create(:ecm_pictures_attached_picture) }

    context 'associations' do
      it { should belong_to(:picture) }
      it { should belong_to(:pictureable) }
    end # context 'associations'

    context 'validations' do
      it { should validate_presence_of(:picture) }
      it { should validate_presence_of(:pictureable) }
    end # context 'validations'
  end # describe AttachedPicture
end # module Ecm::Pictures

