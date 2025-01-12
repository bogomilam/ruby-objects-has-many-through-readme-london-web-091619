class Waiter

    attr_accessor :name, :years_of_experience

    @@all = [ ]

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(customer, self, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self}
    end

    def customers
        meals.map { |customer| meal.customer}
    end

    def best_tipper
      tip = meals.max_by { |meal| meal.tip}
        tip.customer
    end

end