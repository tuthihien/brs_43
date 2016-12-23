module ApplicationHelper
  def full_title page_title
    base_title = t "book_review"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def index_continue object, index, per_page
    (object.to_i - 1) * per_page.to_i + index + 1
  end
end
