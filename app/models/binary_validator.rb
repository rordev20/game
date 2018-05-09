class BinaryValidator < ActiveModel::EachValidator
  # custom binary validator
  def validate_each(record, attribute, value)
    unless value =~ /\A[0,1]*\Z/
      record.errors[attribute] << (options[:message] || I18n.t('validation.custom_message.only_binary'))
    end
  end
end