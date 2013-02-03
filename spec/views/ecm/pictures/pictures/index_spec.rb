require 'spec_helper'

describe "ecm/pictures/pictures/index.html.erb" do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  before do
    @pictures = FactoryGirl.create_list(:ecm_pictures_picture, 5)
    assign(:pictures, @pictures)
    render
  end

  it { view.should render_template(:partial => "_picture", :count => @pictures.count) }
  it { @pictures.each { |picture| rendered.should have_content(picture.name) } }
end

