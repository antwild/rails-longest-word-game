Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new', as: :new
  get 'score', to: 'games#score'
  post 'score', to: 'games#score'
end
