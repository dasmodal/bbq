class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    omniauth('VK')
  end

  def google_oauth2
    omniauth('Google')
  end

  private

  def omniauth(provider_title)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider_title)
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t('devise.omniauth_callbacks.failure', kind: provider_title, reason: 'authentication error')
      redirect_to new_user_registration_url
    end
  end
end
