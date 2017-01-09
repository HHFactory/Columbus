module ItemImagesHelper
  def post_params
    params.require(:item_images).permit(:url_path)
  end
end
