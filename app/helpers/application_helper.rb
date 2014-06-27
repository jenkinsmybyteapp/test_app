module ApplicationHelper
  def flash_class_name(name)
    case name
      when :notice then 'info'
      when :success then 'success'
      when :error then 'danger'
    else
      'warning'
    end
  end
end
