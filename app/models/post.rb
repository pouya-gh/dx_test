class Post < ActiveRecord::Base
  belongs_to :user

  #mount_uploader :image, PostImageUploader
  #mount_uploader :video, PostVideoUploader

  validates :title, presence: true
  validates :digest, presence: true
  #validates :video, presence: true

  def self.find_by_tag(tag)
    Post.where("'#{tag}' = ANY (tags)")
  end
end
