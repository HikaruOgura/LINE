Rails.application.routes.draw do
    resources :users do
        resources :chats
        resources :friends
    end
    root "users#index"
end
