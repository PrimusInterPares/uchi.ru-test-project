Rails.application.routes.draw do
  resources :schools do
    resources :klasses, on: :member, path: :classes do
      resources :students, on: :member, only: :index
    end
  end

  resources :students, only: %i[create destroy]
end
