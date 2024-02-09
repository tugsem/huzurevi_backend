# app/controllers/concerns/name_capitalization.rb

module NameCapitalization
  extend ActiveSupport::Concern

  included do
    before_action :capitalize_first_name, only: [:create, :update]
  end

  private

  def capitalize_first_name
    params[:patient][:first_name].capitalize! if params[:patient][:first_name].present?
  end
end
