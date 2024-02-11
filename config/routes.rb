Rails.application.routes.draw do
  resources :schools do
    resources :klasses, on: :member, path: :classes do
      resources :students, on: :member
    end
  end
end
