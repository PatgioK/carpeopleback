class Person < ApplicationRecord
    has_many :cars, dependent: :destroy
    # has_many :cars
end
