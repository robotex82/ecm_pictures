module Ecm::PicturesHelper
  def render_picture_gallery(name, options = {})
    gallery = Ecm::Pictures::PictureGallery.where(:name => name).first
    
    content_tag(:div, :class => 'picture-gallery', :id => "picture-gallery-#{name}") do
      if gallery.nil?
        content_tag(:span, :class => 'warning') do
          I18n.t('ecm.pictures.warnings.missing_gallery', name)
        end      
      else
      end
    end.html_safe
  end
  
  def render_picture(name, options = {})
  end
end
