Rails.application.routes.draw do
  root to: 'curriculums#index'
  resources :curriculums
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
