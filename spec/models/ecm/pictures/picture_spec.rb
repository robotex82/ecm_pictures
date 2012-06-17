module Ecm
  module Pictures
    describe Picture do
      it "is a rails model" do
        should be_kind_of(ActiveRecord::Base)
      end
    end
  end
end    
