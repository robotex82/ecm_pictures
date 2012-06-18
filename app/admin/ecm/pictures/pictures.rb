include ActiveAdmin::ActsAsList::Helper

if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Pictures::Picture do
    menu :parent => I18n.t('ecm.pictures.active_admin.menu')
    
    # active_admin-acts_as_list
    config.sort_order = 'picture_gallery_id, position'
    sortable_member_actions    
    
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        f.input :picture_gallery
        f.input :name
        f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
        f.input :description
      end
      
      f.buttons
    end    
    
    index do
      column :thumbnail do |picture|
        link_to(image_tag(picture.image.url(:thumb)), admin_ecm_pictures_picture_path(picture))
      end
      column :picture_gallery
      column :name
      column :image_file_size, :sortable => :image_file_size do |picture|
        number_to_human_size(picture.image_file_size)
      end
      column :created_at
      default_actions
    end
    
    show do
      attributes_table do
        row :picture_gallery
        row :name
        row :image_file_name
        row :image_file_size do |picture|
          number_to_human_size(picture.image_file_size)
        end
        row :image_fingerprint
      end
      
      panel Ecm::Pictures::Picture.human_attribute_name(:description) do
        div do
          ecm_pictures_picture.description
        end
      end      
    end
  end 
end  
