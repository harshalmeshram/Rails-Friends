class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many  :friends

         #before_create do

         before_create :greeting_message

         def greeting_message
          puts "Hey ! I will run"

        end

end

