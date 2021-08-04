Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competitions do
    resources :teams
    resources :competition_teams
  end

  resources :teams
end
