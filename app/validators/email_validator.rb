class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    record.errors.add attribute, 'Email is invalid'
  end
end
