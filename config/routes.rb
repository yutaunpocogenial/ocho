Rails.application.routes.draw do

  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  
  
    root :to => 'opinions#index'

  
  get '/opinions' => 'opinions#index'
  get '/popular' => 'opinions#popular'
  get '/speed' => 'opinions#speed'
  get '/about' => 'opinions#about'
  get '/contact' => 'opinions#contact'
  get '/submit' => 'opinions#submit'
  get '/mypage' => 'opinions#mypage'


  resources :opinions
  resources :comments
  


end
