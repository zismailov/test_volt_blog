Rails.application.routes.draw do
  post "auth_user" => "authentication#authenticate_user"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: %w[show create index]
    end
  end
end
