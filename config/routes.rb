Fightinjoe::Application.routes.draw do
  devise_for :users

  # RESTful routes
  resources :blog do
#      b.resources :comments
  end

  namespace :admin do
    resources :blogs
  end

  resources :comment

  #r.match(%r{/(\d+)/(\d+)/([a-zA-Z\-]+)}).to(
  #  :controller => 'blogs', :action => 'show', :year => "[1]", :month => "[2]", :path_title => "[3]"
  #)

  # NAMED routes
  match '/contact' => 'contact', :controller => 'comments', :action => 'new'

  match '/:category_title' => 'category' , :controller => 'blogs', :action => 'index', :as => 'category'

  # Used for path generation
  match '/:year/:month/:path_title' => 'blog#by_date', :controller => 'blogs', :action => 'show'

  # Change this for your home page to be available at /
  root :to => 'blogs#index'

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
  # root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
