# frozen_string_literal: true

class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)
	    
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
		  set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
		else
	 	 session["devise.#{provider}_data"] = env["omniauth.auth"]
         redirect_to new_user_registration_url
		end
      end
    }
  end
	
# 	 session["devise.#{provider}_data"] = env["omniauth.auth"]
#           redirect_to new_user_registration_aurl
  [:kakao, :facebook, :google_oauth2].each do |provider|
    provides_callback_for provider
  
  # provider별로 서로 다른 로그인 경로 설정

  def after_sign_in_path_for(resource)
	
	if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end# You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

