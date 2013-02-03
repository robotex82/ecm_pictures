class Ecm::Pictures::PictureGalleriesController < ApplicationController
  def index
    @picture_galleries = Ecm::Pictures::PictureGallery.all
  end

  def show
    @picture_gallery = Ecm::Pictures::PictureGallery.find(params[:id])
  end
end
