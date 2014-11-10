class ChangePostDigestFromStringToText < ActiveRecord::Migration
  def up
    change_column :posts, :digest, :text
  end

  def down
    change_column :posts, :digest, :string
  end
end
