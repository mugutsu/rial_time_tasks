class Project < ApplicationRecord
    #Добавляем связанную модель
    has_many :access_to_project
    has_many :task
    #Проверка при сохранении
    validates :name, presence: true,
                    length: { minimum: 5 }

end
