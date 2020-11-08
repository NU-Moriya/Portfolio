Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  root 'homes#top'
  get 'about' => 'homes#about'
  post 'guest_sign_in' => 'homes#new_guest'
  
  resources :users, only:[:show, :update, :edit]
    namespace :admin do
      resources :users, only:[:index, :update]
      get 'users/search' => 'users#search'
    end
  get 'users/:id/quit' => 'users#quit'
  patch 'users/:id/invalid' => 'users#invalid'
  
  resources :commitments, only:[:show, :index, :create] do
    resources :like_commitments, only: [:create, :index, :destroy]
  end
  get 'commitments/search' => 'commitments/search'
  
  resources :posts, except:[:new] do
    resource :bravos, only:[:index, :create, :destroy]
    resources :post_comments, except:[:new, :index, :show]
  end
  get 'posts/search' => 'posts#search'
  get 'posts/ranking' => 'posts#ranking'
  
  resources :connects, only:[:create, :show]
  
  post 'messages' => 'messages#create'
  
  
end
