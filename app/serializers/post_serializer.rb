class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :url

  def url
    "/posts/#{object.id}"
  end
end
