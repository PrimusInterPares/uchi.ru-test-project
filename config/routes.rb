Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope path: "schools/:school_id" do
    resources :klasses, path: :classes, only: :index, module: :schools do
      resources :students, on: :member, only: :index, module: :klasses
    end
  end

  resources :students, only: %i[create destroy]
end
