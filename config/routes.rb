Rails.application.routes.draw do
    get 'homepage/index'

    resources :users do
        resources :classes do
            resources :students do
                resources :flashcards
            end
        end
    end

    root 'homepage#index'
end
