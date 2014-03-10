class BuildConfiguration < ActiveRecord::Base
  belongs_to :app

  validates :name, :commands, presence: true
  validates :name, length: {maximum: 200}
  validates :commands, length: {maximum: 2000}
end
