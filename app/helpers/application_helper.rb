# frozen_string_literal: true

##
module ApplicationHelper
  def tooltip_field(field_name, id, full_string)
    "<div id='#{field_name}_#{id}'>#{full_string[0..20]}</div>
      <div class='mdl-tooltip' data-mdl-for='#{field_name}_#{id}'>#{full_string}</div>".html_safe
  end
end
