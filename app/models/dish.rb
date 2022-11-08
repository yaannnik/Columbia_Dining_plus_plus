class Dish < ActiveRecord::Base
    def self.all_halls
      ['All', 'John Jay', 'JJ', 'Ferris Booth Commons']
    end

    def self.with_hall(hall)
      Dish.where( hall: hall )
    end

    def self.with_filter(hall_name, sort_by)
      if hall_name.nil? || hall_name == 'All'
        all.order sort_by
      else
        Dish.where(hall: hall_name).order sort_by
      end
    end
    # calories.map(&:upcase)
    
    def self.with_orders(sort_by)
        all.order sort_by
    end
  end