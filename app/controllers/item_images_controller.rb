class ItemImagesController < ApplicationController
  protect_from_forgery except: [:create]

  # upload image file
  # post /v1/item/images
  # @param[file] image file
  # @param[string] image division
  # @return[json] saved item_image entity
  def create
    uploder = ImageUploader.new
    uploder.store!(params[:file])

    render :json => save_item_image(uploder.url, params[:division])
  end

  # save item_images entity
  # @param[String] uploded file path
  # @param[String] image division
  # @return[ItemImage] saved item_image entity
  private
  def save_item_image(file_path, image_division)
    item_image = ItemImage.new
    item_image.url_path = ENV['AP_HOST'] + file_path
    item_image.division = image_division
    item_image.save!
    return item_image
  end




end
