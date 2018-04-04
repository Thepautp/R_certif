Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "training", to: "training_pages#new"
  root "training_pages#new"
end
