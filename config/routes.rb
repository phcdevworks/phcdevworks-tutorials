PhcdevworksTutorials::Engine.routes.draw do

    # Tutorial Routes
    namespace :tutorial do
        resources :posts, class_name: "Tutorial::Post" do
            resources :steps, class_name: "Tutorial::Step"
        end
    end

    # Command Routes
    namespace :command do
        resources :posts, class_name: "Command::Post" do
            resources :items, class_name: "Command::Item"
        end
    end

    # Frontend Routes
    namespace :blog do
        resources :tutorials, only: [:index, :show]
        resources :commands, only: [:index, :show]
    end

    # API Routes
    namespace :api, :path => "", :constraints => {:subdomain => "tutorial_api"} do
        namespace :v1 do
            resources :posts, defaults: {format: "json"}
            resources :categories, defaults: {format: "json"}
        end
    end

    # Mount Routes
    mount PhcdevworksAccounts::Engine, :at => '/'
    mount PhcdevworksCoreModules::Engine, :at => '/'

end
