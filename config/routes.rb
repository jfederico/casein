Rails.application.routes.draw do
  
  match "/admin" => redirect("/members"), :via => :get
  
  namespace :members do
  
    resources :admin_users do
      member do
        patch :update_password, :reset_password
      end
    end
    
    resource :admin_user_session, :only => [:new, :create, :destroy]
    resource :password_reset, :only => [:create, :edit, :update]
        
    match "/blank" => "members#blank", :via => :get
    root :to => "members#index"
  end
  
end
