Rails.application.routes.draw do
  root "questions#new"
  resources :questions do
    resources :options do
      resources :responses
    end
  end
end
