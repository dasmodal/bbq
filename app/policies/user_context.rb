class UserContext
  attr_reader :user, :pincode, :cookies

  def initialize(context)
    @user = context[:user]
    @pincode = context[:pincode]
    @cookies = context[:cookies]
  end
end
