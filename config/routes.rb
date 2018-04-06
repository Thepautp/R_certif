Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "training", to: "training_pages#new"
  get "admin", to: "training_pages#add_question"
  get "admin/question", to: "training_pages#question_manage"
  post "admin/question", to: "training_pages#question_manage"
  get "admin/ajax", to: "training_pages#ajax_api"
  post "admin/result", to: "training_pages#add_result"
  post "result", to: "training_pages#result"
  root "training_pages#new"
end
