module Ecm::PicturesHelper
  def render_picture_gallery(name, options = {})
    options = {:preview_style => :thumb}.merge(options)
    
    gallery = Ecm::Pictures::PictureGallery.where(:name => name.to_s).first

    content_tag(:div, :class => 'picture-gallery', :id => "picture-gallery-#{gallery.to_param}") do
      if gallery.nil?
        content_tag(:span, :class => 'warning') do
          I18n.t('ecm.pictures.warnings.missing_gallery', :name => name.to_s)
        end      
      else
        content_tag(:h1, gallery.name) +
        content_tag(:ul, {:class => 'pictures'}) do
          gallery.pictures.collect do |picture|
           content_tag(:li, {:class => 'picture', :id => "picture-#{picture.to_param}"}) do
              concat(content_tag(:h2, picture.name, :class => 'picture-name')) unless picture.name.blank?
              concat(link_to(image_tag(picture.image.url(options[:preview_style]), :alt => picture.description), picture.image.url, {:rel => "lightbox[#{gallery.to_param}]"}))
              concat(content_tag(:div, picture.description, :class => 'picture-description'))
            end
          end.join.html_safe
        end.html_safe
      end
    end.html_safe
  end
  
  def render_picture(name, options = {})
  end
end
