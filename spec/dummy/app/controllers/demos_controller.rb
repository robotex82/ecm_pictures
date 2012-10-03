class DemosController < ApplicationController
  def picture_gallery_helper
    if @picture_gallery = Ecm::Pictures::PictureGallery.first
      @picture_gallery_name = @picture_gallery.name
    else
      @picture_gallery = nil
    end
  end

  def picture_helper
    if @picture = Ecm::Pictures::Picture.first
      @picture_name = @picture.name
    else
      @picture = nil
    end  
  end
end
