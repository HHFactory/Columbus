class ItemImagesController < ApplicationController
  protect_from_forgery except: [:create]

  # post
  def create
    item_image = ItemImage.new
    item_image.url_path = File.open(params[:file])
    item_image.save!

    puts item_image.url_path
    render :nothing=>true, :status=>201
  end

  def post_params
    params.require(:file).permit(:url_path, :division, :file)
  end

end
