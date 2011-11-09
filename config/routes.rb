Fortunka::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

 resources :fortunes do
  resources :comments
  collection do
    get :tags
  end
end

match "/auth/:provider/callback" => "sessions#create"
match "/signout" => "sessions#destroy", :as => :signout

  root :to => "fortunes#index"	

end
