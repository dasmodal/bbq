class UserContext
  attr_reader :user, :cookies

  def initialize(context)
    @user = context[:user]
    @cookies = context[:cookies]
  end
end
