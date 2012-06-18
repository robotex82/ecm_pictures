if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Pictures::PictureGallery do
    menu :parent => I18n.t('ecm.pictures.active_admin.menu')
    
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
      end
      
      f.buttons
    end
  end
end  
