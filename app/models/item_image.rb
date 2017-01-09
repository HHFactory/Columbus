# entity of itemImage
require ''
class ItemImage < ActiveRecord::Base
  mount_uploader :url_path, ImagesUploader
end
