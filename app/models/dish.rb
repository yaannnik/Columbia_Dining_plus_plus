class Dish < ActiveRecord::Base
    def self.all_halls
      ['John Jay', 'JJ', 'Ferrys Booth Commons']
    end
    def self.with_orders(sort_by)
        all.order sort_by
    end
  end