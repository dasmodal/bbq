module ApplicationHelper
  def user_avatar(user)
    asset_pack_path 'media/images/user.png'
  end

  def user_avatar_thumb(user)
    asset_pack_path 'media/images/user.png'
  end

  def event_photo(event)
    asset_pack_path 'media/images/event.jpg'
  end
end
