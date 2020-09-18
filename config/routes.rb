Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :user_comments do
    resources :reply_user_comments
  end 
  root "users#show"
  resources :users do
    member do
      get "user_message"
    end
  end


  resources :projects do
    resources :join_project_users
    resources :tasks do
      resources :task_comments
      collection do
        get "search"
      end
    end
    resources :project_comments
    collection do
      get "search"
      patch "complete"
    end
  end

  resources :comments
  resources :start_times, only: :create
  resources :stop_times, only: :create
end
