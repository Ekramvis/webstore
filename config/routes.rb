Webstore::Application.routes.draw do
  resources :users
	resource :session
	resources :products, :only => [:index]
	resource  :cart
end
