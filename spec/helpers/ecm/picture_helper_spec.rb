require "spec_helper"

describe Ecm::PicturesHelper do
  describe "#render_picture_gallery" do
    it "returns a div tag" do
      helper.render_picture_gallery('Holydays 2012').should =~ /div/
    end
    
    describe "with a missing gallery" do
      it "renders a warning" do
        helper.render_picture_gallery('Some missing gallery').should =~ /warning/
      end
    end
  end
end

