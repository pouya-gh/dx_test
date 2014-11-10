class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :digest, presence: true

  def find_by_tag
    
  end
end
