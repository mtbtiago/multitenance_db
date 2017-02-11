class User < ApplicationRecord
  validates :name, presence: true, length: { in: 3..12 }, uniqueness: true
  validates :domain,
            presence: true,
            format: { with: /\A[a-z]{3,12}\z/ },
            uniqueness: true
  after_save :create_domain

  private

  def create_domain
    Apartment::Tenant.create(domain)
  end
end
