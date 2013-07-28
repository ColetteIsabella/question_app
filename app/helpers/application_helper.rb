module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "question_app").join(" - ")
      end
    end
  end
end
