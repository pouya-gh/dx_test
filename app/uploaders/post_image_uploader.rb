# encoding: utf-8

class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  
  include UploaderHelper
  after :remove, :delete_empty_upstream_dirs
  
  storage :file
  
  def store_dir
    "assets/images/posts/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  end

  # Create different versions of your uploaded files:
  version :small do
    process :resize_to_fit => [75, 50]
  end

  version :medium do
    process :resize_to_fit => [200, 125]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
