Rails.application.routes.draw do
  # resources :likes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :tweets do
    resources :likes
  end
  get '/api/news' => 'api#news'
  resources :api do 
    resources :news
  end

  post "/tweets/othertweet" => "tweets#othertweet", :as => :othertweet

  get '/api/:fecha1/:fecha2' => 'api#date'

  root 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
