require 'spec_helper'

module Ecm
  module Pictures
    describe PictureGalleriesController do
      describe "GET index" do
        it "assigns all ecm_pictures_picture_galleries to @picture_galleries" do
          picture_galleries = FactoryGirl.create_list(:ecm_pictures_picture_gallery, 3)
          get :index
          assigns(:picture_galleries).should eq(picture_galleries)
        end
      end

      describe "GET show" do
        it "assigns a picture_gallery to @picture_gallery" do
          picture_gallery = FactoryGirl.create(:ecm_pictures_picture_gallery)
          get :show, :id => picture_gallery
          assigns(:picture_gallery).should eq(picture_gallery)
        end
      end
    end
  end
end

