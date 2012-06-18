if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Pictures::Picture do
    menu :parent => I18n.t('ecm.pictures.active_admin.menu')
    
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        f.input :name
        f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
        f.input :description
      end
      
      f.buttons
    end    
  end 
end  
