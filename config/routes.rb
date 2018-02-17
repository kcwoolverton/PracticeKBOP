Rails.application.routes.draw do
    get 'homepage/index'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :users do
        resources :courses do
            resources :students do
                resources :flashcards
            end
        end
    end

    root 'homepage#index'
end
