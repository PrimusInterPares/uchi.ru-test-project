Rails.application.routes.draw do
  scope path: "schools/:school_id" do
    resources :klasses, path: :classes, only: :index, module: :schools do
      resources :students, on: :member, only: :index, module: :klasses
    end
  end

  resources :students, only: %i[create destroy]
end
