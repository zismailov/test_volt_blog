class DateTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value)
    record.errors.add(attr_name, :invalid) if (begin
                                                  DateTime.parse(value)
                                                rescue StandardError
                                                  ArgumentError
                                                end) == ArgumentError
  end
end
