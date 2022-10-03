module UsersHelper
  def omniauth_social_media_icon(provider)
    case provider
    when :vkontakte then asset_pack_path 'media/images/social_icon/vk-icon-30.png'
    when :google_oauth2 then asset_pack_path 'media/images/social_icon/google-icon-30.png'
    end
  end
end
