Rails.application.routes.draw do
  resources :bloggers
  resources :posts do
    put :likes
  end
  resources :destinations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
