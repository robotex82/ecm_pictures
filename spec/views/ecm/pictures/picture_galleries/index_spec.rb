require 'spec_helper'

describe "ecm/pictures/picture_galleries/index.html.erb" do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  before(:each) do
    @picture_galleries = FactoryGirl.create_list(:ecm_pictures_picture_gallery_with_pictures, 5)
    assign(:picture_galleries, @picture_galleries)
    render
  end

  it { view.should render_template(:partial => "_picture_gallery_for_index", :count => @picture_galleries.count) }
  it { @picture_galleries.each { |picture_gallery| rendered.should include(picture_gallery.name) } }
end

