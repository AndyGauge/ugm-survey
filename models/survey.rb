class Survey < ActiveRecord::Base
  has_many :answers
  belongs_to :client, class_name: "Person"
  belongs_to :staff,  class_name: "Person"
end