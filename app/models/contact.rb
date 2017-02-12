class Contact < ApplicationRecord
  validates :name, presence: true, length: { in: 3..12 }, uniqueness: true
end
