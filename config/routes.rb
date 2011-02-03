CincopalabritasCom::Application.routes.draw do

  get "word_set/destroy"

  get "home/index"

  devise_for :users # , :controllers => { :registrations => 'registrations' }

  #custom route names
  devise_for :users do
    get "/entrar" => "devise/sessions#new"
  end
  devise_scope :user do
    get "/cerrar_session" => "devise/sessions#destroy"
  end
  devise_scope :user do
    get "/registrate" => "devise/registrations#new"
  end

  root :to => "home#index"

  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create'
  
    
  resources :user do
    resources :word_sets
    member do
      get :dashboard
      get :find_friends
      get :settings
    end

    collection do
      get :validate_form_data
      post :share_on_wall
    end
    
  end

  match 'dashboard' => 'user#dashboard', :as => 'user_root'
  

  match '/:username' => 'user#show', :as => :show_user


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
