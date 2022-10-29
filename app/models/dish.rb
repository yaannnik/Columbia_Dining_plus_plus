class Dish < ActiveRecord::Base
    def self.all_halls
      ['John Jay', 'JJ', 'Ferrys Booth Commons']
    end

    def self.with_hall(hall)
      Dish.where({ hall: hall })
    end

    def self.with_calories(calories, sort_by)
      if calories.nil?
        all.order sort_by
      else
        where(calories: calories.map(&:upcase)).order sort_by
      end
    end
    
    def self.with_orders(sort_by)
        all.order sort_by
    end
  end