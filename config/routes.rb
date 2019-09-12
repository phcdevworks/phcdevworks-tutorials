PhcdevworksTutorials::Engine.routes.draw do

  # Tutorial Routs
  namespace :tutorial do
    resources :posts, class_name: 'PhcdevworksTutorials::Tutorial::Post' 
    resources :categories, class_name: 'PhcdevworksTutorials::Tutorial::Category' 
  end

  # Mount Routes
  mount PhcdevworksAccounts::Engine, :at => '/'

end
