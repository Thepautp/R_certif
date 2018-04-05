Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "training", to: "training_pages#new"
  post "result", to: "training_pages#result"
  root "training_pages#new"
end
