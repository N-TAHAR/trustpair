Rails.application.routes.draw do
  resources :ibans, param: :name, only: %i[index create show update destroy]
  get '/random_iban', to: 'ibans#random'
end
