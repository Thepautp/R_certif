Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "training", to: "training_pages#new"
  get "admin", to: "training_pages#add_question"
  post "admin", to: "training_pages#add_question"
  get "admin/question", to: "training_pages#question_manage"
  post "admin/question", to: "training_pages#question_manage"
  delete "admin/question", to: "questions#destroy"
  get "admin/ajax", to: "training_pages#ajax_api"
  post "result", to: "training_pages#result"
  get 'questions/destroy'
  root "training_pages#home"
  get '*path' => redirect('/')
end
