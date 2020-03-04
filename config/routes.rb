Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  
  get 'welcome/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
