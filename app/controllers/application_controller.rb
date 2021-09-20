class ApplicationController < ActionController::API
  include ExceptionHandler

  after_action :set_code_on_create, only: [:create]

  private

  def set_code_on_create
    response.status = 201 if response.status == 200
  end
end
