class ApplicationController < ActionController::Base
  layout :set_out

  private def set_out
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
end
