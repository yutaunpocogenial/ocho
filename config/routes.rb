Rails.application.routes.draw do

  
  

  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  
  
    root :to => 'opinions#speed'

  
  
  get '/speed' => 'opinions#speed'
  get '/sport' => 'opinions#sport'
  get '/tech' => 'opinions#tech'
  get '/pol' => 'opinions#pol'
  get '/enta' => 'opinions#enta'
  get '/econo' => 'opinions#econo'
  get '/cul' => 'opinions#cul'
  get '/about' => 'opinions#about'
  get '/contact' => 'opinions#contact'
  get '/submit' => 'opinions#submit'
  get '/mypage' => 'opinions#mypage'
  get '/opinions' => 'opinions#speed'
  get '/search' => 'opinions#search'


  resources :users, only: [:index, :show]
  resources :opinions do
   resources :likes, only: [:create, :destroy]
 end

  resources :comments
  resources :judges
  


end
