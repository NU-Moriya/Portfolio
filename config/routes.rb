Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  root 'homes#top'
  get 'about' => 'homes#about'
  post 'guest_sign_in' => 'homes#new_guest'
  
  get 'users/quit/:id' => 'users#quit', as: 'user_quit'
  patch 'users/invalid' => 'users#invalid'
  resources :users, only:[:show, :update, :edit, :index]
    namespace :admin do
      patch 'users/invalid' => 'users#invalid'
      get 'users/search' => 'users#search'
      resources :users, only:[:index, :update]
    end
  
  get 'commitments/search' => 'commitments/search'
  resources :commitments, only:[:show, :index, :create] do
    resource :like_commitments, only: [:create, :destroy]
  end
  
  get 'posts/search' => 'posts#search'
  get 'posts/ranking' => 'posts#ranking'
  resources :posts, except:[:new] do
    resources :bravos, only:[:index, :create, :destroy]
    resources :post_comments, except:[:new, :index, :show]
  end

  
  resources :connects, only:[:create, :show, :index]
  
  post 'messages' => 'messages#create'
  
  
end
