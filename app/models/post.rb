class Post < ApplicationRecord

  # Include a behavior (moved to concerns: /app/controllers/concerns/sluggable.rb for reusability)
  include Sluggable

  # Validation Rules
  # validates :name, presence: true # name is required
  # validates :name, presence: { message: 'You must enter the title of the Post' }
  # validates :name, length: { maximum: 250 }
  # validates :name, length: { minimum: 2 }
  # validates :name, length: { is: 20 }
  # validates :name, length: { is: 2 }, on: :create # only when creating
  # validates :name, length: { is: 2 }, allow_blank: true # allow blank values
  # validates :name, length: { is: 2 }, allow_nil: true # allow nil values
  # validates :name, length: { is: 2 }, strict: true # throw exception in case of invalid
  # validates :name, length: { is: 2 }, if: :check_content # check with a method
  # validates :name, length: { is: 2 }, unless: :check_content
  # validates :name, length: { is: 2 }, if: Proc.new { |record| record.content.length < 10 } # inline method
  # validates :name, length: { in: 3..20 }
  # validates :name, format: { with: /\A[a-zA-Z]+\z/ }
  # validates :name, uniqueness: true
  # validates :name, acceptance: true # for checkbox, e.g. accepting license...
  # validates :password, confirmation: true # will look for matching value of: password_confirmation
  # validates :email, :email => true # https://rubygems.org/gems/validate_email

  # Custom method validator
  # validate :my_validation_method

  # Custom class validator (you can put validators at: /app/validators, in this demo checkout: /app/models/validators/name_validator.rb)
  # validates_with NameValidator


  # EachValidator is used for multiple field validation: for out name_validator we've created at /models/validators/name_validator.rb
  validates :name, name: { message: ' should be greater than 2.'}
  validates :content, name: true

  # https://guides.rubyonrails.org/v4.1.16/active_record_callbacks.html
  # before_validation :default_slug, if: Proc.new { (!self.name.nil? && !self.name.empty?) && (self.slug.nil? || self.slug.empty?) }
  # before_validation :default_slug #, only: :create
  # before_save :default_slug2
  # validates :slug, format: { with: /\A[a-z0-9\-]+\z/}, uniqueness: true
  # before_validation do
  #
  # end

  # Custom json formatter
  def as_json(options = nil)
    super(only: [:name, :id, :created_at])
  end

  # def check_content
  #   content.length < 10
  # end

  # def my_validation_method
  #   if name.nil? || name.length < 2
  #     # errors.add(:name, 'length must be greater than 2 chars.')
  #     # You can add error type along with the error message
  #     errors.add(:name, :not_2, { message: 'length must be greater than 2 chars.' })
  #   end
  # end


end
