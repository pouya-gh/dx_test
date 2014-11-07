class PostPolicy
  def initialize(cuser, post)
    @cuser, @post = cuser, post
  end

  def new?
    @cuser.admin?
  end

  def edit?
    @cuser.admin?
  end
end
