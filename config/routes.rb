Rails.application.routes.draw do
  get '/questions/myquestions', to: 'questions#myquestions', as: 'questions_myquestions'
  devise_for :users
  get 'welcome/index'
  resources :questions do
      resources :answers do
        member do
          put "upvote", to: "answers#upvote"
          put "downvote", to: "answers#downvote"
        end
      end
  end
  root 'welcome#index'
end
