module ApplicationHelper
  def document_title
    @title.present? ? "#{@title} -BAUKIS2021" : "BAUKIS2021"
  end
end
