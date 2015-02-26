Rails.application.routes.draw do
  

  

 # resources :sections do
  #  resources :videos, only: [:index, :new, :create]
  #end
  #get 'videos/index'

  #post '/rate' => 'rater#create', :as => 'rate'
  resources :instructors


  #devise_for :admin_users, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  #resources :sections
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'} 
  #devise_for :users
  get 'pages/about'

  get 'pages/contact'

  get 'home' => "enrollments#home"

  get ':id/classroom', to: "courses#classroom", as: :classroom
  #resources :wishlists
  #get 'addVideos' => "videos#addVideos"

  #get ':name', to: 'courses#classroom', as: :course

  #post 'courses/:id/addToWishlist', to: 'shortlists#addToWishlist', as: :addToWishlist

  #post 'courses/:id/removeFromWishlist', to: 'courses#removeFromWishlist', as: :removeFromWishlist

  #resources :courses

resources :courses do
    collection do
      get 'search'
    end
    resources :shortlists
  end

  resources :courses do
    resources :reviews, except: [:show, :index]
  end

  resources :courses do
    resources :enrollments, only: [:new, :create]
  end

  #get '/courses/:course_id/sections/:id', to: 'sections#coursesections'

  resources :sections do
        resources :videos, only: [:index, :new, :create]
  end

  resources :courses do
    #resources :build, controller: 'courses/build'
      resources :sections 
  end

  #resources :categories

  resources :categories do
    resources :courses
  end

  #resources :products do
   # resources :build, controller: 'products/build'
  #end

  root 'courses#index'

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
