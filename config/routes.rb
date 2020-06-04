# frozen_string_literal: true

Rails.application.routes.draw do
  resources :scientists, :inventions
  root to: 'scientists#start'
  get '*path', to: 'application#not_found'
end
