class PicturesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
    @pictures = Picture.all

  end

  def new
    @picture = Picture.new
  end

  def show
    @pictures
  end

  def create
    @picture = Picture.new(image_params)
    @picture.save
    redirect_to pictures_path
  end

  private

  def image_params
    params.require(:picture).permit(:image, :description)
  end

end
