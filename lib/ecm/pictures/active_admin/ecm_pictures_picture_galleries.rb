include ActiveAdmin::ActsAsList::Helper

if defined?(ActiveAdmin)
  ActiveAdmin.register Ecm::Pictures::PictureGallery do
    menu :parent => I18n.t('ecm.pictures.active_admin.menu')
    
    config.sort_order = 'position'
    sortable_member_actions
    
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :link_images
      end
      
     f.inputs do
      f.has_many :pictures do |p|
        p.input :name
        #if !p.object.id.nil?
        if p.object.persisted?
          p.input :_destroy, :as => :boolean, :label => I18n.t('active_admin.delete')
        end
        p.input :image, :as => :file, :hint => p.template.image_tag(p.object.image.url(:thumb))
        p.input :description
      end
    end      
      
      f.buttons
    end
    
    index do
      sortable_columns
      column :name
      column :pictures_count
      column :link_images do |picture_gallery|
        I18n.t(picture_gallery.link_images)
      end
      column :created_at
      column :updated_at
      default_actions
    end
    
    show do
      attributes_table do
        row :name
        row :pictures_count
        row :link_images do |picture_gallery|
          I18n.t(picture_gallery.link_images)
        end
        row :created_at
        row :updated_at
      end
      
      panel Ecm::Pictures::PictureGallery.human_attribute_name(:description) do
        div do
          ecm_pictures_picture_gallery.description
        end
      end
      
      panel Ecm::Pictures::PictureGallery.human_attribute_name(:display_code) do
        div do
          ecm_pictures_picture_gallery.display_code
        end
      end      
      
      panel Ecm::Pictures::PictureGallery.human_attribute_name(:pictures) do
        table_for ecm_pictures_picture_gallery.pictures, :i18n => Ecm::Pictures::Picture do
          sortable_columns
          column :thumbnail do |picture|
            link_to(image_tag(picture.image.url(:thumb)), admin_ecm_pictures_picture_path(picture))
          end
          column :name
          column :image_file_size, :sortable => :image_file_size do |picture|
            number_to_human_size(picture.image_file_size)
          end
          column :created_at
          column do |picture|
            link_to I18n.t('active_admin.view'), admin_ecm_pictures_picture_path(picture), :class => "member_link view_link"
          end
        end
      end
    end
  end
end  
