Rails.application.routes.draw do
  root 'pages#home'

  resource :registrations, only: [:create, :edit, :update, :show]
  resource :registrations, path: '/', only: [] do
    get :new, path: '/register', as: 'new'
  end
  resource :sessions
end
