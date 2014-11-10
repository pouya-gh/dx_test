class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :digest, presence: true

  def self.find_by_tag(tag)
    Post.where("'#{tag}' = ANY (tags)")
  end
end
