Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :user_comments
  root "projects#index"
  # root " devise/sessions#new"
  resources :users
  resources :projects do
    resources :join_project_users
    resources :tasks do
      resources :task_comments
    end
    resources :project_comments
  end

  resources :start_times
  resources :stop_times
end
