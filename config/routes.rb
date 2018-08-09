Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root directory
  root to: 'cocktails#index'

  # show wall cocktails in the database
  get 'cocktails', to: 'cocktails#index', as: 'cocktails'

  # take me back to the /cocktails directory after creating a new cocktail
  post 'cocktails', to: 'cocktails#create'

  # form to fill out to create new cocktail
  get 'cocktails/new', to: 'cocktails#new', as: 'new_cocktail'

  # show details of one cocktail
  get 'cocktails/:id', to: 'cocktails#show', as: 'cocktail'

  
end
