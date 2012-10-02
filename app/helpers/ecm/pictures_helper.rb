module Ecm::PicturesHelper
  # renders picture galleries in your views
  #
  # = Usage
  #
  # Assume you have created a picture gallery named "Holidays 2012". You can 
  # render it in your view as follows:
  # 
  #  <%= render_picture_gallery 'Holidays 2012' %>
  def render_picture_gallery(name, options = {})
    begin  
      options = {:preview_style => :thumb}.merge(options)
      
      gallery = Ecm::Pictures::PictureGallery.where(:name => name.to_s).first
      gallery_identifier = gallery.to_param rescue 'missing'

      if gallery.nil?
        content_tag(:span, :class => 'warning') do
          I18n.t('ecm.pictures.warnings.missing_gallery', :name => name.to_s)
        end      
      else
        render gallery
      end

    rescue Exception => e
      return e.message
    end  
  end
  
  # helper method to build link options for images inside a gallery.
  def build_link_options_for_picture_in_gallery(gallery_identifier, picture)
    link_options = {}
    
    # Add gallery identifier for orange box
    link_options[:rel] = "lightbox[#{gallery_identifier}]"
    
    # Add thumbnail class for twitter bootstrap
    link_options[:class] = "thumbnail"
    
    # build the caption
    caption = ""
    caption << "<div class=\"caption-name\">#{picture.name}</div>" unless picture.name.blank?
    caption << "<div class=\"caption-description\">#{picture.description}</div>" unless picture.description.blank?   
    link_options[:"data-ob_caption"] = caption if caption.size > 0
    
    return link_options
  end
  
  # TODO: Implement this.
  def render_picture(name, options = {})
  end
end
