# frozen_string_literal: true

Rails.application.routes.draw do
  get root to: 'mains#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
