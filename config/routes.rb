Rails.application.routes.draw do
  root :to => "businesses#index"

  get 'businesses/:id', to: 'businesses#show' #, as: 'business'

end
