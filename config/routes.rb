Rails.application.routes.draw do
    get 'tasks/index'
    get 'projects/index'

    devise_for :users
    resources :projects do
        resources :access_to_projects
        resources :tasks
    end
    #Для установки выполнения задачи
    post 'tasks/update_done'
    get 'persons/profile'
    get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'home#index'
end
