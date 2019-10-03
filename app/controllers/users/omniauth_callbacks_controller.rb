# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_identity
  before_action :set_user

  attr_reader :identity, :user

  def kakao
    auth_login("kakao")
  end

  def facebook
    auth_login("facebook")
  end

  # def after_sign_in_path_for(resource)
  #   root_path
  # end

  private

  def auth_login(provider)
    if identity.present?
      identity.update(identity_attrs)
    else
      user.identities.create(identity_attrs)
    end
    sign_in user
    if user_signed_in?
      redirect_to root_path, notice: "you signed in with #{provider} account"
    else
      redirect_to root_path, notice: "you failed to login"
    end
  end

  def auth
    request.env['omniauth.auth']
  end

  def set_identity
    @identity = Identity.where(provider: auth.provider, uid: auth.uid).first
  end

  def set_user
    if user_signed_in?
      @user = current_user
    elsif identity.present?
      @user = identity.user
    elsif User.where(email: auth.info.email).any?
      flash[:alert] = "login with another account that has #{auth.provider}"
    else
      @user = User.create(
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        name: auth.info.name
      )
    end
  end

  def identity_attrs
    {
      provider: auth.provider,
      uid: auth.uid,
      access_token: auth.credentials.token,
    }
  end

end
