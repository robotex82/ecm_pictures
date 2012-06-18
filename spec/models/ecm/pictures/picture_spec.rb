module Ecm
  module Pictures
    describe Picture do
      it "is a rails model" do
        should be_kind_of(ActiveRecord::Base)
      end
      
      it do
        subject.should have(1).error_on(:image)
      end       
    end
  end
end    
