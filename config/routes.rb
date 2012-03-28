IsotopeRails3::Application.routes.draw do
  mount Stylexicon::Engine => "/lexicon"

  root :to => 'home#index'

  devise_for :users, :path => '/', :path_names => { :sign_in => 'login', :sign_out => 'logout' }

  match '/about' => 'users#index', :as => :about_index
  match '/about/alumni' => 'users#alumni', :as => :about_alumni
  match '/about/:id' => 'users#show', :as => :about
  resources :users do
    member do
      put :change_password
    end
  end
  resources :posts, :path => :blog
  resources :contact
  resources :lolnohaxplz_incoming_mails, :controller => 'incoming_mails'

  match '/blog/tags/:id' => 'posts#tagged_with', :as => :blog_tag

  match '/services' => 'services#index'
  match '/services/phasezero' => 'services#phasezero'
  match '/services/socialmedia' => 'services#socialmedia'
  match '/services/ecommerce' => 'services#ecommerce'
  match '/services/mlm' => 'services#mlm'
  match '/services/financial' => 'services#financial'
  match '/services/insurance' => 'services#insurance'
  match '/services/mobile' => 'services#mobile'
  match '/services/saas' => 'services#saas'
  
  match '/case_studies' => 'case_studies#index'
  match '/case_studies/autopartstomorrow' => 'case_studies#autopartstomorrow'
  

  match '/community' => 'community#index'
  match '/community/get_github_project' => 'community#get_github_project'
  match '/community/xrono' => 'community#xrono'
  match '/community/rubyham' => 'community#rubyham'
  match '/community/state_machine_audits' => 'community#state_machine_audits'
  match '/community/techbirmingham' => 'community#techbirmingham'
  match '/community/contract_acceptance_framework' => 'community#contract_acceptance_framework'
  match '/community/bootstrap_will_paginate' => 'community#bootstrap_will_paginate'
  match '/community/css3_progress_bar_rails' => 'community#css3_progress_bar_rails'
  match '/community/isotope_contacts' => 'community#isotope_contacts'
  match '/community/quote_app' => 'community#quote_app'
  match '/community/spree_suppliers_extension' => 'community#spree_suppliers_extension'
  match '/community/data_science_theater_3000' => 'community#data_science_theater_3000'
  match '/community/jenkins_isotope_style' => 'community#jenkins_isotope_style'

  match '/home/payments' => 'home#payments'
  match '/home/resources' => 'home#resources'
  match '/home/careers' => 'home#careers'

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
