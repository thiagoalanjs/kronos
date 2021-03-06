Rails.application.routes.draw do
  
  post '/tinymce_assets' => 'tinymce_assets#create'
  
  # CRUMBOARD
  get '/task/take_task/:id', to: 'scrumboard#take_task', as: 'take_task'
  get '/task/get_out_task/:id', to: 'scrumboard#get_out_task', as: 'get_out_task'
  get '/task/send_to_code_review/:id', to: 'scrumboard#send_to_code_review', as: 'send_to_code_review'
  get '/task/send_task_to_test/:id', to: 'scrumboard#send_task_to_test', as: 'send_task_to_test'
  get '/task/redo_task/:id', to: 'scrumboard#redo_task', as: 'redo_task'
  get '/task/done_task/:id', to: 'scrumboard#done_task', as: 'done_task'

  get '/project/scrumboard/:id', to: 'projects#scrumboard', as: 'scrumboard'
  get '/settings', to: 'settings#index', as: 'settings'

  #root to: redirect('/users/sign_in')
  root to: 'projects#index'
  
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # routes for select and deselect projects
  get '/select/project/:id', to: 'projects#select', as: 'select_project'
  delete '/deselect/project', to: 'projects#deselect', as: 'deselect_project'
  post '/sprints/:id', to: 'sprints#change_status', as: 'change_sprint'
  #

  # normal_user 
  get '/projects/list', to: 'projects#user_project', as: 'user_project'
  get '/project/chart/:id', to: 'projects#chart', as: 'chart'
  #devise_for :users, :controllers  => {
  #           :registrations => 'users/registrations',
  #           :sessions => 'users/sessions'
  #         }
  resources :priorities
  resources :kinds 
  resources :task_requirements
  resources :tasks do
    resources :comments
  end
  resources :user_story_acceptance_criterions
  resources :user_stories
  resources :sprints
  resources :releases
  resources :managment_risks

  resources :themes do
    get :autocomplete, :on => :collection
  end

  resources :projects
  resources :functions

  devise_for :users
    scope "/users" do
      resources :users
  end
  #devise_for :users
  #resources :users
  resources :function_user_projects
  
  # mount Notifications::Engine => "/notifications"
  resources :notifications
  delete '/clean', to: 'notifications#clean', as: 'clean_notifications'
end
