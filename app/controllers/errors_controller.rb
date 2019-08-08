class ErrorsController < ApplicationController
  def not_found
    render file: 'layouts/error_404', status: :not_found
  end

  def permission_denied
    render file: 'layouts/error_422', status: :unprocessable_entity
  end

  def internal_server_error
    render file: 'layouts/error_500', status: :internal_server_error
  end
end
