Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  default_url_options :host => "localhost:3000/"
  namespace :api, defaults: {format: :json} do
    resources :users, only: %w[show]
  end

  devise_for :users,
         defaults: {format: :json},
         path: '',
         path_names: {
           sign_in: '/api/login',
           sign_out: '/api/logout',
           registration: '/api/signup'
         },
         controllers: {
           sessions: 'sessions',
           registrations: 'registrations'}
end
