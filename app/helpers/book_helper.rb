module BookHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  def display_book
    keys = %w(title author)

    html = ""

    keys.each do |key|
      html += tag.a send(:"#{key}")
      html += tag.a " "
    end

    html.html_safe
  end
end
