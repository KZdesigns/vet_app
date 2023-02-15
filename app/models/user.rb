class User < ApplicationRecord
    validates :email, uniqueness: { message: "must be a unique email"}
    validates :email, :password, :phone, presence: { message: "must have an email, password, and a phone number"}
    validates :phone, length: { minimum: 10 }
    validates :password, length: { minimum: 5 }
    validates :email, format: { with: /\A[\w.+-]+@\w+\.\w+\z/ } #TODO: learn more about regex delete this comment when spike is complete
end
