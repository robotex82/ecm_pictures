require 'spec_helper'

describe "ecm/pictures/pictures/show.html.erb" do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  before do
    @picture = FactoryGirl.create(:ecm_pictures_picture)
    assign(:picture, @picture)
    controller.request.path_parameters[:id] = @picture.id
    render
  end

  it { view.should render_template(:partial => "_picture", :count => 1) }
  it { rendered.should have_content(@picture.name) }
end

