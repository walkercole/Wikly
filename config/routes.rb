Rails.application.routes.draw do
  devise_for :users
  	root 'home#index'

	patch 'user_path' => 'users#avatar', as: "user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
