Rails.application.routes.draw do
  resources :target_scores
  resources :students
  root to: 'curriculums#index'
  resources :curriculums do
    get 'average_ranking', on: :collection
    get 'math_ranking', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
