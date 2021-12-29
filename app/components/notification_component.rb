class NotificationComponent < ViewComponent::Base
  attr_reader :type, :data

  def initialize(notification:)
    @type = notification[0]
    @data = parse_data(notification[1])
  end

  def icon
    case type
    when 'success'
      inline_svg_tag("icons/success.svg", class: "notifications__item-icon has-text-success")
    when 'notice'
      inline_svg_tag("info.svg", class: "notifications__item-icon has-text-info")
    when 'alert'
      inline_svg_tag("alert.svg", class: "notifications__item-icon has-text-warning")
    when 'error'
      inline_svg_tag("icons/error.svg", class: "notifications__item-icon has-text-danger")
    end
  end

  def render?
    data.present?
  end

  private
  def parse_data(data)
    case data
    when Hash
      data
    else
      { title: data }
    end
  end
end