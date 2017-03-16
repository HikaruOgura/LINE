Rails.application.routes.draw do
    resources :users do
        resources :chats
    end
end
