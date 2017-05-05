Rails.application.routes.draw do
  root "questions#new"

  resources :questions do
    resources :options, only: [:index, :new, :create]
    resources :results, only: [:index]
  end

  resources :options, only: [:show, :edit, :update, :destroy] do
    resources :responses, only: [:new, :create]
  end

  resources :responses, only: [:show, :edit, :update, :destroy]
end
