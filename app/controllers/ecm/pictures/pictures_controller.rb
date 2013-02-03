class Ecm::Pictures::PicturesController < ApplicationController
  def index
    @pictures = Ecm::Pictures::Picture.all
  end

  def show
    @picture = Ecm::Pictures::Picture.find(params[:id])
  end
end
