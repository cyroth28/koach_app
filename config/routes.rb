Rails.application.routes.draw do

  resources :pts

  resources :patients, except: :index

  resource :pt_session, only: [:new, :create, :destroy]

  resource :patient_session, only: [:new, :create, :destroy]

  resources :pending_patients, only: [:new, :create, :destroy, :edit, :update]
end
