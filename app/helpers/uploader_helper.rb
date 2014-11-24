module UploaderHelper
  def delete_empty_upstream_dirs
    path = File.expand_path(store_dir, root)
    Dir.delete(path) # fails if path not empty dir
  rescue SystemCallError
    true # nothing, the dir is not empty
  end
end
