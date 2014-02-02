CreativesApp::Application.routes.draw do
  root 'creatives#index'
  get 'tags', to: 'tags#index'
 
  resources :creatives do
    resources :chapters
    resource :comments
    resources :pictures
  end
  
  get '/' => 'creatives#index', :as => :search
  post 'creatives/:id/reorder' => 'creatives#reorder', :as => :reorder
  get 'creatives/:id/read' => 'creatives#read', :as => :read_creative
  post 'creatives/:creative_id/pictures/:id/crop' => 'pictures#crop', :as => :crop_picture
  patch 'creatives/:creative_id/pictures/:id/retouch' => 'pictures#retouch', :as => :retouch_picture
  post 'creatives/:id/mistake' => 'creatives#mistake', :as => :mistake_creative

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  
end
