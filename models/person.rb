class Person < ActiveRecord::Base
  enum role: [:client, :staff]
  has_many :surveys

end
