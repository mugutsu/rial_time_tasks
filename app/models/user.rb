class User < ApplicationRecord
    has_many :project
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
     #Упрощение запроса через scope User.user_list(current_user)
     scope :user_list, ->(user) { where.not(:id => user.id) }
     #Методы
     def self.list(user)
         @result = []
         @result.push(["",0])
         User.where('id!=?',user.id).each do |user_db|
             @result.push([user_db.email,user_db.id])
         end
         @result
     end
end
