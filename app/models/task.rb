class Task < ApplicationRecord
  belongs_to :project

  def self.priority(id)
      @result = ""
      case id
          when 0
              @result = "Обычный"
          when 1
               @result ="Неотложный"
           else
               @result = "Обычный"
      end
      @result
  end

end
