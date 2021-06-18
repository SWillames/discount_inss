Rails.application.routes.draw do
  resources :proponents
  get '/calculation', controller: :calculates, action: :calculate
  devise_for :employees, :controllers => { registrations: 'registrations' }
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end