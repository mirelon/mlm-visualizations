module ApplicationHelper

  def flash_level(level)
    case level.to_sym
      when :success then 'alert-success' # Green
      when :notice then 'alert-info' # Blue
      when :error then 'alert-danger' # Red
      when :alert then 'alert-warning' # Yellow
      else level
    end
  end

end
