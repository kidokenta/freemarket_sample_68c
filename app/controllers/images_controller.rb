class ImagesController < ApplicationController
  def create
    @image = @item.images.new(image_params)
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end
end
