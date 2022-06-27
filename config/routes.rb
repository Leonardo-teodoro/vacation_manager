Rails.application.routes.draw do
  root "employees#index"
  resources :vacation_ranges
  resources :employees
  get 'show/vacation_ranges/eligibles', to: 'vacation_ranges#show_vacation_eligibles', as: 'show_vacation_eligibles'
  get 'list/vacation_ranges/:employee_id', to: 'vacation_ranges#show_employee_ranges', as: 'show_employee_ranges'
  
 
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
