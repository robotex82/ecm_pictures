require 'active_admin'

module Ecm::Pictures
  module ActiveAdmin
    module PictureableHelper
      def form_inputs_for_pictureable(f)
        f.inputs do
          f.has_many :pictures do |p|
            p.input :name
            p.input :image, :as => :file, :hint => p.template.image_tag(p.object.image.url(:default_thumb))
            p.input :description

            p.inputs do
              p.input :markup_language, :as => :select, :collection => Ecm::Pictures::Configuration.markup_languages
            end # p.inputs
          end # f.has_many :pictures
        end # f.inputs

        f.inputs do
          f.has_many :attached_pictures do |p|
            p.input :picture, :as => :select, :collection => Ecm::Pictures::Picture.all.collect { |picture| [picture, picture.id, {:style => "background-image: url('#{picture.image.url(:medium_thumb)}'); width: #{Ecm::Pictures::Configuration.picture_image_styles[:medium_thumb].split('x').first}px; height: #{Ecm::Pictures::Configuration.picture_image_styles[:medium_thumb].split('x').last}px; background-repeat: no-repeat; background-position: center;"}] }
          end # f.has_many :attached_pictures
        end # f.inputs
      end # def

      def panel_for_pictureable
        panel Ecm::Pictures::PictureGallery.human_attribute_name(:pictures) do
          table_for resource.pictures, :i18n => Ecm::Pictures::Picture do
            sortable_columns
            column :thumbnail do |picture|
              link_to(image_tag(picture.image.url(:default_thumb)), [:admin, picture])
            end # column
            column :name
            column :image_file_size, :sortable => :image_file_size do |picture|
              number_to_human_size(picture.image_file_size)
            end # column
            column :created_at
            column do |picture|
              link_to(I18n.t('active_admin.view'), [:admin, picture], :class => "member_link view_link") +
              link_to(I18n.t('active_admin.edit'), [:edit, :admin, picture], :class => "member_link edit_link") +
              link_to(I18n.t('active_admin.delete'), [:admin, picture], :class => "member_link delete_link", :method => :delete) +
              link_to(I18n.t('active_admin.delete_link'), [:admin, picture.attached_pictures.where(:pictureable_type => resource.class, :pictureable_id => resource).first], :class => "member_link delete_link", :method => :delete)
            end # column
          end # table_for
        end # panel
      end # def
    end # module PictureableHelper
  end # module ActiveAdmin
end # module Ecm::Pictures

::ActiveAdmin::ResourceDSL.send :include, Ecm::Pictures::ActiveAdmin::PictureableHelper
::ActiveAdmin::Views::Pages::Show.send :include, Ecm::Pictures::ActiveAdmin::PictureableHelper
::ActiveAdmin::Views::Pages::Form.send :include, Ecm::Pictures::ActiveAdmin::PictureableHelper
