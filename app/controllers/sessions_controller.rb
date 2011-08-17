class SessionsController < ApplicationController
  
  def twitter
    @user = User.find_for_twitter_auth_oauth(env["omniauth.auth"], nil)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "User"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_data"] = env["omniauth.auth"]
      redirect_to root_path #new_user_registration_url
    end
  end
  
  def facebook
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to root_path #new_user_registration_url
    end
  end
  
  def mixi
    @user = User.find_for_mixi_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "mixi"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.mixi_data"] = env["omniauth.auth"]
      redirect_to root_path #new_user_registration_url
    end
  end

	def create
		provider = env["omniauth.auth"]['provider']
		@user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => provider
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.session_data"] = env["omniauth.auth"]
      redirect_to root_path #new_user_registration_url
    end
	end
end
