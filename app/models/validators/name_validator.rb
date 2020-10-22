# class NameValidator < ActiveModel::Validator
class NameValidator < ActiveModel::EachValidator

  # def validate(record)
  #   if record.name.nil? || record.name.length < 2
  #     record.errors.add(:name, 'length must be greater than 2 chars.')
  #   end
  # end

  def validate_each(record, attribute, value)
    if value.nil? || value.length < 2
      # puts options.inspect # for debugging
      # either default message or custom one
      message = options[:message] || 'length must be greater than 2 chars.'
      record.errors.add(attribute, message)
    end
  end

end
