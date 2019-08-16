Rails.application.routes.draw do

  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  
  
    root :to => 'opinions#speed'

  
  
  get '/speed' => 'opinions#speed'
  get '/about' => 'opinions#about'
  get '/contact' => 'opinions#contact'
  get '/submit' => 'opinions#submit'
  get '/mypage' => 'opinions#mypage'


  resources :opinions
  resources :comments
  resources :judges
  


end
