Rails.application.routes.draw do
  
  
  root "index#signin"
  get "/signin", to: "index#signin", as: "signin"
  post "/login", to: "index#login", as: "login"
  get "/userprofile", to: "index#userprofile", as: "userprofile"
  get "/register", to: "index#register", as: "register"
  post "/registeruser", to: "index#registeruser", as: "registeruser"
  get "/logout", to:"index#logout",as:"userlogout"
  delete '/deletebooks/:id' , to:"index#deletebooks" ,as: "deletex"
  post "/addbook",to:"index#addbook", as:"addbook"
end
