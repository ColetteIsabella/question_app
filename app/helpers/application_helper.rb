module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "question_app").join(" - ") unless parts.empty?
      end
    end
  end
end
