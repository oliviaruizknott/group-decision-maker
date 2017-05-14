Rails.application.routes.draw do
  root "questions#new"

  resources :questions do
    resources :options, only: [:index, :new, :create]
    resources :results, only: [:index]
    resources :details, only: [:index]
    resources :thanks, only: [:index]
  end

  resources :options, only: [:show] do
    resources :responses, only: [:new, :create]
  end

  resources :responses, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :questions, only: [:index, :show] do
        resources :options, only: [:create]
      end
      resources :options, only: [:show] do
        resources :responses, only: [:index, :create]
      end
    end
  end
end
