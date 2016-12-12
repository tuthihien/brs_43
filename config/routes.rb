Rails.application.routes.draw do
  root "static_pages#home"
  get "detail" => "static_pages#detail"
end
