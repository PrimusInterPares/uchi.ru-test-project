Rails.application.routes.draw do
  scope module: :schools, path: "schools/:school_id" do
    resources :klasses, path: :classes, only: :index do
      resources :students, on: :member, only: :index
    end
  end

  resources :students, only: %i[create destroy]
end
