Stock::Application.routes.draw do
  namespace :requests do  namespace :transferences do  namespace :finished do  namespace :components do resources :details end end end end

  namespace :requests do  namespace :transferences do  namespace :finished do resources :components end end end

  get "entry/index", :to => "entry#index"

  get "activity", :to => 'activity#index'
  get 'activity/:id', :to => 'activity#show'

  get "stock/products/index", :to => "stock/products#index"
  get "stock/products/transactions", :to => "stock/products#transactions"
  get "stock/products/list_products"
  get "stock/products/list_components"
  
  get "stock/production/list_components"
  get "stock/production/list_products"
  get "stock/production/index", :to => "stock/production#index"
  get "stock/production/transactions", :to => "stock/production#transactions"


  namespace :stock do
    get "raw_material", :to => "raw_material#index"
    get "raw_material/list"
    get "raw_material/transactions", :to => "raw_material#transactions"
  end

  namespace :requests do  namespace :devolutions do  namespace :components do resources :details end end end

  namespace :orders do  namespace :productions do resources :details end end

  namespace :requests do  namespace :devolutions do  namespace :products do resources :details end end end

  namespace :requests do  namespace :transferences do  namespace :products do resources :details end end end

  namespace :requests do  namespace :transferences do  namespace :components do resources :details end end end

  namespace :requests do  namespace :purchases do  namespace :components do resources :details end end end

  namespace :products do  namespace :compositions do resources :details end end

  namespace :requests do  namespace :devolutions do resources :components end end

  namespace :orders do resources :productions end

  namespace :requests do  namespace :devolutions do resources :products end end

  namespace :requests do  namespace :transferences do resources :products end end

  namespace :requests do  namespace :transferences do resources :components end end

  namespace :requests do  namespace :purchases do resources :components end end

  namespace :products do resources :compositions end

  namespace :transactions do resources :statuses end

  namespace :locations do resources :cities end

  namespace :locations do resources :regions end

  namespace :locations do resources :countries end

  namespace :locations do resources :continents end

  namespace :components do resources :brands end

  namespace :components do  namespace :categories do resources :kinds end end

  namespace :settings do
    get '/', :to => 'settings#index'
    get 'permissions', :to => 'permissions#index'
    match 'permissions/:role_id', :to => 'permissions#of_role', :via => 'get'
    post 'permissions/save'
    resources :roles

    put 'configurations', :to => 'configurations#update'
    get 'company', :to => 'configurations#company'
  end

  namespace :components do
    resources :items
    resources :categories
  end

  devise_for :users, :path_names => {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }, :controllers => {
    registrations: 'users/registrations'
  }

  #root :to => "application#index"
  root :to => "stock/raw_material#index"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
