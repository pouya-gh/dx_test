class UserPolicy
  # Gets user returned by current_user method and the user
  # that explicitly passed to it
  def initialize(cuser, user)
    @cuser, @user = cuser, user
  end

  def show?
    @cuser == @user
  end
end
