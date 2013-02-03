require 'spec_helper'

module Ecm
  module Pictures
    describe PicturesController do
      describe "GET index" do
        it "assigns all ecm_pictures_pictures to @pictures" do
          pictures = FactoryGirl.create_list(:ecm_pictures_picture, 3)
          get :index
          assigns(:pictures).should eq(pictures)
        end
      end

      describe "GET show" do
        it "assigns a picture to @picture" do
          picture = FactoryGirl.create(:ecm_pictures_picture)
          get :show, :id => picture
          assigns(:picture).should eq(picture)
        end
      end
    end
  end
end

