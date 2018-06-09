# frozen_string_literal: true

# movies helper class
module ApplicationHelper
  def field_validation_class(resource, field_name)
    if resource.errors[field_name].any?
      'form-control is-invalid'
    else
      'form-control'
    end
  end
end
