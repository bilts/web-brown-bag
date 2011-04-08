module ApplicationHelper
  def html_list(type, elements, options = {})
    if elements.blank?
      ""
    else
      lis = elements.map { |x| content_tag("li", x) }
      content_tag(type, lis, options, false)
    end
  end

  def ul(*args)
    html_list("ul", *args)
  end

  def ol(*args)
    html_list("ol", *args)
  end
end
