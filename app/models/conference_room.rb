class ConferenceRoom < ApplicationRecord
    validates :room_number, presence: true, length: {minimum: 3, maximum: 3},
    numericality: { only_integer: true, message: "enter only integer values" }
end