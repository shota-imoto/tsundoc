module TsundocHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  def display_tsundoc
    keys = %w(status priority_pt)

    html = ""
    keys.each do |key|
      html += tag.a "#{key}: "
      html += tag.a send(:"#{key}")
      html += tag.a " "
    end
    html.html_safe
  end
end
