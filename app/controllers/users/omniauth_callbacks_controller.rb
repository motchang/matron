# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def bitbucket
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      auth = request.env['omniauth.auth']
      @user = User.find_or_create_by(uid: auth.uid, provider: auth.provider)
      @user.email = auth.info.email
      @user.save!

      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Bitbucket') if is_navigational_format?
    end

    def failure
      redirect_to root_path
    end

    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    # You should also create an action method in this controller like this:
    # def twitter
    # end

    # More info at:
    # https://github.com/plataformatec/devise#omniauth

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
  end
end
