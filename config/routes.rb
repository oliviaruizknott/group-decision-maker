Rails.application.routes.draw do
  root "questions#new"
  resources :questions
end
