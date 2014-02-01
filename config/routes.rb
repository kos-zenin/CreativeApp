CreativesApp::Application.routes.draw do
  root 'creatives#index'
  get 'tags', to: 'tags#index'
 
  resources :creatives do
    resources :chapters
    resource :comments
    resources :pictures
  end
  
  resources :users

  post 'creatives/:id/reorder' => 'creatives#reorder', :as => :reorder
  get 'creatives/:id/read' => 'creatives#read', :as => :read_creative
  post 'creatives/:creative_id/pictures/:id/crop' => 'pictures#crop', :as => :crop_picture
  patch 'creatives/:creative_id/pictures/:id/retouch' => 'pictures#retouch', :as => :retouch_picture

  devise_for :users, :controllers => {:registrations => "registrations"}

  
end
