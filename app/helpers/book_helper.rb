module BookHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  def display
    keys = %w(title author)

    html = tag.a self.class
    html += " "
    keys.each do |key|
      html += tag.a send(:"#{key}")
      html += tag.a " "
    end
    html.html_safe
  end
end
