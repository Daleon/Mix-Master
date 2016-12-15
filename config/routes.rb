Rails.application.routes.draw do
  # resources :artists, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show, :edit, :update]
  resources :playlists, except: [:delete]
end
