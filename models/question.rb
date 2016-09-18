class Question < ActiveRecord::Base
  validates :text, presence: true
  has_many :answers

  before_save :slugify

  private
  def slugify
    return true if slug.present?
    self.slug = text.gsub(/[^\w]/, '').downcase[0,29]
    true
  end 
end
