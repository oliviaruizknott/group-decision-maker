Rails.application.routes.draw do
  root "questions#new"
  resources :questions do
    resources :options
  end
end
