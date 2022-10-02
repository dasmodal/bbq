class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    binding.pry
    @user = User.find_for_vkontakte_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Vkontakte')
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t('devise.omniauth_callbacks.failure', kind: 'Vkontakte', reason: 'authentication error')
      redirect_to new_user_registration_url
    end
  end

  def facebook
    binding.pry
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Facebook')
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t('devise.omniauth_callbacks.failure', kind: 'Facebook', reason: 'authentication error')
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Google')
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t('devise.omniauth_callbacks.failure', kind: 'Google', reason: 'authentication error')
      redirect_to new_user_registration_url
    end
  end
end
