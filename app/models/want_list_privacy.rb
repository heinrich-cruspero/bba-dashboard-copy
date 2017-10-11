class WantListPrivacy < ApplicationRecord
  validates :name, uniqueness: true

  has_many :want_lists

  def self.private
    find_by(name: 'Private')
  end

  def self.public
    find_by(name: 'Public')
  end

  def private
    self == WantListPrivacy.private
  end

  def public
    self == WantListPrivacy.public
  end
end
