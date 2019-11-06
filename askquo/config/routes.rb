Rails.application.routes.draw do
  get '/questions/myquestions', to: 'questions#myquestions', as: 'questions_myquestions'
  devise_for :users
  get 'welcome/index'
  resources :questions do
      resources :answers
  end
  root 'welcome#index'
end
