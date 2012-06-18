module Ecm
  module Pictures
    describe PictureGallery do
      it "is a rails model" do
        should be_kind_of(ActiveRecord::Base)
      end
      
      it do
        subject.should have(1).error_on(:name)
      end       
      
      it "should have a nice id" do
        picture_gallery = build(:picture_gallery, :name => 'Holydays 2012')
        picture_gallery.save
        picture_gallery.to_param.should == 'holydays-2012'
      end
    end
  end
end    
