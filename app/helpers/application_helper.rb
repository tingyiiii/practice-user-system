module ApplicationHelper
  def current_user
    @user8888 ||= User.find_by(id: session[User::SessionKey])
  end

  def user_signed_in?
    current_user
  end
end
