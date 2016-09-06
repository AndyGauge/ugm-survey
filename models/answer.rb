class Answer < ActiveRecord::Base
  has_one :staff,  class_name: "Person", through: :survey
  has_one :client, class_name: "Person", through: :survey
  belongs_to :survey
  belongs_to :question
end