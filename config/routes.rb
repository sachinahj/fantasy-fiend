Rails.application.routes.draw do



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # resources :players

  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show', as: :player

  get '/ODP', to: 'overall_draft_positions#index', as: :overall_draft_position

  
  get 'compare', to: 'compare#index'
  get 'compare/laboratory', to: 'compare#laboratory'
  get 'compare/quarterbacks', to: 'compare#quarterbacks'
  get 'compare/runningbacks', to: 'compare#runningbacks'
  get 'compare/receivers', to: 'compare#receivers'
  get 'compare/tightends', to: 'compare#tightends'
  get 'compare/kickers', to: 'compare#kickers'
  get 'compare/defenses', to: 'compare#defenses'
  
  root :to => "players#index" 

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
