# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bitbucket, ENV['BITBUCKET_KEY'], ENV['BITBUCKET_SECRET']
end
