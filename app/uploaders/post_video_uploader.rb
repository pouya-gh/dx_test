# encoding: utf-8

class PostVideoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    File.expand_path(File.join(Rails.root, 'app/assets/videos/', model.id))
  end

  def extension_white_list
    %w(mp4 ogv webm m4v)
  end
end
