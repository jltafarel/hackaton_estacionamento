Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  match 'cadastrar_motorista', to: 'rest#cadastrar_motorista', via: [:post]

  match 'cadastrar_carro', to: 'rest#cadastrar_carro', via: [:post]

  match 'fazer_login', to: 'rest#fazer_login', via: [:post]

  match 'info_motorista/:id_motorista', to: 'rest#info_motorista', via: [:get]

  match 'add_credito', to: 'rest#add_credito', via: [:post]

  match 'cadastrar_motorista', to: 'rest#cadastrar_motorista', via: [:post]

  match 'checkin/:id_motorista/:id_carro', to: 'rest#checkin', via: [:get]

  match 'checkout/:id_estacionamento', to: 'rest#checkout', via: [:get]

  match 'consultar_carro/:placa', to: 'rest#consultar_carro', via: [:get]

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
