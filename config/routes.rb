Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "result", to: "training_pages#result"
  get 'question/new', to: "questions#new"
  get 'question/show', to: "questions#show"
  post 'question/show', to: "questions#show"
  get 'question/edit', to: "questions#edit"
  post 'question/create', to: "questions#create"
  post 'question/update', to: "questions#update"
  delete 'question/delete', to: "questions#destroy"
  root "training_pages#home"
  get '*path' => redirect('/')
end
