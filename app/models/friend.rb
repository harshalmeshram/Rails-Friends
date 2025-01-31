class Friend < ApplicationRecord
    #belongs_to :user

    validates :first_name, :last_name, :email, presence: true
    validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
    
    validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters are allowed '  }
    #validates :age, presence: true, numericality: true  
    #before_create :greeting_message

    validate :validate_friend_age

    #after_update  :display_friend_age

    #after_create  :display_friend_age 

    #after_save :display_friend_age

    after_commit :display_friend_age


    def display_friend_age
        if self.date_of_birth.present?
            age = Date.today.year - self.date_of_birth.year
            puts "=== Age of the friends is #{age} ===="
        else
            puts "== Age cannot be calculated without date_of_birth ==="
        end
    end


    def validate_friend_age
        if self.date_of_birth.present?
            age = Date.today.year - self.date_of_birth.year
            if age < 15
                errors.add(:age, 'plese provide a valid date of birth here. Age must be greater than 15')
            end
        end
    end

    def full_name

        "#{first_name} #{last_name}"
    end


    def age
        #if date_of_birth.present?
         #   Date.today.year - date_of_birth.year
        #else
         #  nil
        
        #end

        return nil unless date_of_birth.present?

        return Date.today.year - date_of_birth.year
    end

    def name_with_email
        "#{full_name} / #{email}"
    end


    # before_create  greeting_message
     # puts "Hey ! I will run before you create an object !"
    # end 
end


