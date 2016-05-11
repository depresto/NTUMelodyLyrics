Rails.application.routes.draw do
  root 'pages#init'

  # Let's encrypt
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'

  get '/init'   => 'pages#init',    :as => 'init'
  get '/login'  => 'pages#login',   :as => 'login'
  get '/main'   => 'pages#main',    :as => 'main'
  # Same as:
  # get :init, :login, :main, controller: :pages
  scope 'admin' do
    get '/adduser'      => 'admin#adduser',     :as => 'adduser'
    get '/property'  => 'admin#property', :as => 'property'
  end

  post  '/addproperty'    => 'admin#addproperty'

  scope '/borrow' do
    get '/room'           => 'borrowpages#room',      :as => 'borrowroom'
    get '/book'           => 'borrowpages#book',      :as => 'borrowbook'
    get '/keyboard'       => 'borrowpages#keyboard',  :as => 'borrowkeyboard'
  end

  get   '/calendar'       => 'borrowpages#calendar',  :as => 'calendar'

  resources :users, only: [:create, :show], path: '/login/user'

  resource :session, only: [:create, :destroy]
  get   '/session'        => 'sessions#index',  :as => 'session_index'
  post  '/borrow/:type'   => 'sessions#borrow'
  get   '/getevent/:type' => 'sessions#getevent'
  post  '/delevent/:type' => 'sessions#delevent'

  post  '/login/token'    => 'sessions#token',  :as => 'token'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
