Rails.application.routes.draw do
  root "employees#index"
  resources :vacation_ranges
  resources :employees
  get '/eligibles', to: 'vacation_ranges#show_vacation_eligibles', as: 'show_vacation_eligibles'
  get 'ranges/:employee_id', to: 'vacation_ranges#show_employee_ranges', as: 'show_employee_ranges'
  
 
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
