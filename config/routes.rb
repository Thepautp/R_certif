Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "training", to: "training_pages#new"
  get "admin/ajax", to: "training_pages#ajax_api"
  post "result", to: "training_pages#result"
  get 'question/new', to: "questions#new"
  get 'question/show', to: "question#show"
  get 'question/edit', to: "questions#edit"
  post 'question/create', to: "questions#create"
  post 'question/update', to: "questions#update"
  get 'questions/destroy', to: "questions#destroy"
  root "training_pages#home"
  # get '*path' => redirect('/')
end
