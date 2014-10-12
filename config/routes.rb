Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  match 'cadastrar_motorista', to: 'api#cadastrar_motorista', via: [:post]

  match 'cadastrar_carro', to: 'api#cadastrar_carro', via: [:post]

  match 'fazer_login', to: 'api#fazer_login', via: [:post]

  match 'info_motorista/:id_motorista', to: 'api#info_motorista', via: [:get]

  match 'add_credito', to: 'api#add_credito', via: [:post]

  match 'cadastrar_motorista', to: 'api#cadastrar_motorista', via: [:post]

  match 'checkin/:id_motorista/:id_carro', to: 'api#checkin', via: [:get]

  match 'checkout/:id_estacionamento', to: 'api#checkout', via: [:get]

  match 'consulta_carro/:placa', to: 'api#consultar_carro', via: [:get]

  match 'consulta_saldo/:id_motorista', to: 'api#consulta_saldo', via: [:get]

  match 'consulta_tempo/:id_motorista', to: 'api#consulta_tempo', via: [:get]


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
