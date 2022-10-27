class User < ApplicationRecord
    has_secure_password
     #validates :password,presence:true,confirmation: { message:"confirm pass required"},length: { minimum: 4,maximum:6,message:"Password should be 4-25 char" }
     validates :password_confirmation ,presence: true
     validate :passwordtest
    validates :username, presence: true, uniqueness: true,length: { minimum: 4,maximum:25,message:" should be 4-25 char" },format:{with: /\A[a-zA-Z0-9_\.]+\z/ ,message:"is not valid"} 
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'is not valid' }
    
    validates :agreement,presence: true, acceptance: { accept:"1", message:"please accept TnC"}


      private
      def passwordtest
            if password!=nil
                if password.count("a-z")<1
                errors.add(:password," must have atleast 1 downcase alphabet")
                end
                if password.count("A-Z")<1
                errors.add(:password," must have atleast 1 Upcase alphabet")
                end
                if password.count("0-9")<1
                errors.add(:password," must have atleast 1 Number")
                end
                if password.count("\-!@#$%^&*+={}[]|\:;,<>?/()\"")<1
                errors.add(:password," must have atleast 1 special char")
                end  
            end
       
        end


 end


