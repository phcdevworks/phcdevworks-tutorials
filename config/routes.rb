PhcdevworksTutorials::Engine.routes.draw do

  # Tutorial Routs
  namespace :tutorial do
    resources :posts, class_name: "PhcdevworksTutorials::Tutorial::Post" do
      resources :steps, class_name: "PhcdevworksTutorials::Tutorial::Step"
    end
    resources :categories, class_name: "PhcdevworksTutorials::Tutorial::Category"
  end

  # Frontend Routes
  namespace :blog do
    resources :tutorials, only: [:index, :show]
  end

  # API Routes
  namespace :api, :path => "", :constraints => {:subdomain => "tutorial_api"} do
    namespace :v1 do
      resources :posts, defaults: {format: "json"}
      resources :categories, defaults: {format: "json"}
    end
  end

  # Mount Routes
  mount PhcdevworksAccounts::Engine, :at => "/"

end
