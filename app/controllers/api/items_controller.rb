class Api::ItemsController < ApplicationController

  def image_destroy
    image = Image.find(params[:img_id])
    image.destroy
  end

end