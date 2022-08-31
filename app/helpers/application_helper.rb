module ApplicationHelper
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [200, 200])
    else
      asset_pack_path 'media/images/user.png'
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [50, 50])
    else
      asset_pack_path 'media/images/user.png'
    end
  end

  def bg_event_photo(event)
    if event.bg_photo.attached?
      event.bg_photo
    else
      asset_pack_path 'media/images/event.jpg'
    end
  end

  def bg_event_photo_thumb(event)
    if event.bg_photo.attached?
      event.bg_photo.variant(resize_to_fit: [600, 600])
    else
      asset_pack_path 'media/images/event.jpg'
    end
  end

  def sample_event_photo(event)
    # TODO / for event photo, choice random if many photos

    # photos = event.photos.persisted

    # if photos.any?
    #   photos.sample.photo.url
    # else
    #   asset_pack_path 'media/images/event.jpg'
    # end
  end
end
