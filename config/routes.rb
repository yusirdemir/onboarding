Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  Rails.application.routes.draw do
    resources :onboarding_steps do
      resources :onboarding_step_inputs, path: "inputs", as: "inputs"
      resources :onboarding_step_actions, path: "actions", as: "actions"
      resources :onboarding_step_dependencies, path: "dependencies", as: "dependencies"
    end

    resources :company_onboarding_steps do
      collection do
        get "sync_progress"
        get "current_step"
      end
    end
  end
end
