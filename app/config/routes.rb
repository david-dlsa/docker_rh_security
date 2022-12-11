Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: "registrations",
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'welcomes#index'

  resources :job_roles
  resources :workspaces
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '*unmatched', to: 'application#send_error_info', via: :all
end
