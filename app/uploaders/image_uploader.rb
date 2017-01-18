class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/images"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [200, 200]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Upload content type whitelist
  # image file only uploadable
  def content_type_whitelist
    /image\//
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{SecureRandom.hex(5)}#{original_filename}" if original_filename.present?
  end

end
