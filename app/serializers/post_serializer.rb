class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :url

  def url
    "/posts/#{object.id}"
  end
end
