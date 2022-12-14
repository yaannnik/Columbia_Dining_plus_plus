class Dish < ActiveRecord::Base
    validates :name, presence: true
    validates :hall, presence: true
    validates :property, presence: true
    validates :calories, presence: true
    
    def self.all_halls
      ['All', 'John Jay', 'JJ', 'Ferris Booth Commons']
    end

    def self.with_filter(hall_name, sort_by)
      if hall_name.nil? || hall_name == 'All'
        all.order sort_by
      else
        Dish.where(hall: hall_name).order sort_by
      end
    end
  end