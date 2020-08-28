class Person < ApplicationRecord
    validates :name, :house, presence: true

    belongs_to :house,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
end


# Kevin Lai's Comments for Spotting the Error

# For the code execution, do not use the following:

# house = House.new(address: '308 Negra Arroyo Lane')
# person = Person.new(name: 'Walter White', house_id: house.id)

# ^^^ This part messes up the "person.save!" because it calls "house.id",
# but the id for the house is not generated until AFTER "house.save!"

# house.save!
# person.save!

# ==================================================

# Kevin Lai's Comments for Successful Execution

# Instead: Just save after each object's creation!

# house = House.new(address: '308 Negra Arroyo Lane')
# house.save!

# person = Person.new(name: 'Walter White', house_id: house.id)
# person.save!
