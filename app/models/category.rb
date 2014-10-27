class Category < ActiveRecord::Base
  has_many :goals

  def self.types
    %w(travel adventure career fitness/health self-development spiritual ethical/community romance other )
  end
end