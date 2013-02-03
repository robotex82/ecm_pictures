require 'spec_helper'

describe "routing to pictures galleries" do
  it "routes /ecm_pictures_picture_galleries to #index" do
    expect(:get => "/ecm_pictures_picture_galleries").to route_to(
      :controller => "ecm/pictures/picture_galleries",
      :action => "index"
    )
  end # it

  it "routes /ecm_pictures_picture_galleries/example-gallery to #show" do
    expect(:get => "/ecm_pictures_picture_galleries/example-gallery").to route_to(
      :controller => "ecm/pictures/picture_galleries",
      :action => "show",
      :id => "example-gallery"
    )
  end # it
end

describe "routing to pictures" do
  it "routes /ecm_pictures_pictures to #index" do
    expect(:get => "/ecm_pictures_pictures").to route_to(
      :controller => "ecm/pictures/pictures",
      :action => "index"
    )
  end # it

  it "routes /ecm_pictures_pictures/example-picture to #show" do
    expect(:get => "/ecm_pictures_pictures/example-picture").to route_to(
      :controller => "ecm/pictures/pictures",
      :action => "show",
      :id => "example-picture"
    )
  end # it
end

