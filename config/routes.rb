Rails.application.routes.draw do
  
  
  root "user#signin"
  get "/signin", to: "user#signin", as: "signin"
  post "/login", to: "user#login", as: "login"
   get "/register", to: "user#register", as: "register"
  post "/registeruser", to: "user#registeruser", as: "registeruser"
  get "/logout", to:"user#logout",as:"userlogout"

  get "/userprofile", to: "index#userprofile", as: "userprofile"
  delete '/deletebooks/:id' , to:"index#deletebooks" ,as: "deletex"
  get '/newbook(/:id)',to:"index#newbook", as:"newbook"
  post "/addbook",to:"index#addbook", as:"addbook"
end
