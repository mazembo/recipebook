class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :directions
  
  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: proc { |attributes| attributes['step'].blank? }, allow_destroy: true
  
  has_attached_file :image, :styles => { :medium => "400x400#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validate :title, :description, :image, presence: true 
end