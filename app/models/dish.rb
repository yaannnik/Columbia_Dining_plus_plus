class Dish < ActiveRecord::Base
    def self.all_halls
      ['John Jay', 'JJ', 'Ferris Booth Commons']
    end
    def self.with_calories(calories, sort_by)
      if calories.nil?
        all.order sort_by
      else
        where(calories: calories.map(&:upcase)).order sort_by
      end
    end
  end