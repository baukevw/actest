Rails.application.routes.draw do
  root 'pages#home'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
