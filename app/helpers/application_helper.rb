# frozen_string_literal: true

# movies helper class
module ApplicationHelper
    def field_validation_class(resource, field_name)
        if resource.errors[field_name].any?
            return "form-control is-invalid"
        else
            return "form-control"
        end
    end
end
