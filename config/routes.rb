Rails.application.routes.draw do
  root :to => "businesses#index"

  get 'businesses/:id' => 'businesses#show'

end
