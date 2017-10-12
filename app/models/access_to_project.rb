class AccessToProject < ApplicationRecord
  belongs_to :user
  #Добавляем связанную модель
  belongs_to :project
  #Методы
  def self.need_id(user)
      @result = []
      AccessToProject.where(user_id: user.id).each do |access|
        @result = @result + [access.project_id]
      end
      @result
  end
end
