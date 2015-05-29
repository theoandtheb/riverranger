Rails.application.routes.draw do

  get 'home/index'

  get 'more', to: 'more#index'

  get 'thanks', to: 'more#thanks'

  get 'map', to: 'map#index'

  get 'news', to: 'news#index'

  resources :studies

  resources :photos

  resources :documents

  resources :ogrgeojsons

  get 'observations/:id/add_data', to: 'observations#add_data'
  patch 'observations/create_data', to: 'observations#create_data'
  
  resources :observations

  resources :comments
  
  #Tags
  get 'amphibian', to: 'help#amphibian'
  get 'bird', to: 'help#bird'
  get 'fish', to: 'help#fish'
  get 'insect', to: 'help#insect'
  get 'mammal', to: 'help#mammal'
  get 'plant', to: 'help#plant'  
  get 'reptile', to: 'help#reptile'
  get 'species_at_risk', to: 'help#species-at-risk'
  get 'wildlife_death', to: 'help#wildlife-death'
  get 'shoreline_alterations', to: 'help#shoreline-alterations'
  get 'water_quality', to: 'help#water-quality'
  get 'trash', to: 'help#trash'
  get 'foam', to: 'help#foam'
  get 'red_blooms', to: 'help#red-blooms'
  get 'phragmites', to: 'help#phragmites'
  get 'loosestrife', to: 'help#loosestrife'
  get 'dog_strangling_vine', to: 'help#dog-strangling-vine'
  get 'introduced_honeysuckle', to: 'help#introduced-honeysuckle'
  get 'zebra_mussels', to: 'help#zebra-mussels'
  get 'giant_hogweed', to: 'help#giant-hogweed'
  get 'other_invasive', to: 'help#other-invasive'

  #Tests
  get 'ph', to: 'help#ph'
  get 'temperature', to: 'help#temperature'
  get 'phosphate', to: 'help#phosphate'
  get 'clarity', to: 'help#clarity'
  get 'oxygen', to: 'help#oxygen'
  get 'nitri', to: 'help#nitri'
  get 'nitrate', to: 'help#nitrate'
  get 'ecoli', to: 'help#ecoli'

  #other
  get 'test_kit', to: 'help#test-kit'

  #register
  get 'register', to: 'users#new'
 
  
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root :to => 'observations#index'

  resources :password_resets

  resources :users do
    member do
      get :activate
      get :regions
      get :add_region
      get :remove_region
    end
  end

  resources :user_sessions
  
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


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
