Rails.application.routes.draw do
  resources :users do
    resources :posts
    resources :followings
  end

  # You can have multiple resources entries pointing at the same controller.
  # Just make sure that the controller can deal with both situations!
  resources :posts

  resource :session

  get 'global' => 'posts#index'
  get 'timeline' => 'posts#timeline'

  root to: 'landing_page#root'
end
