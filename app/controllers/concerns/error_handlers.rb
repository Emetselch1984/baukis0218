module ErrorHandlers
  extend ActiveSupport::Concern
  included do
    rescue_from StandardError, with: :rescue500
    rescue_from Forbidden, with: :rescue403
    rescue_from IpAddressRejected, with: :rescue403
  end
  private
  def rescue500(e)
    render "errors/internal_server_error",status: 500
  end
  def rescue403(e)
    @exception = e
    render "errors/forbidden",status: 403
  end
end