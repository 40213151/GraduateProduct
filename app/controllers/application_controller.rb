class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys:[
        :name, :job_about,:phone_number, :place, :leader_name, :member_number, :description_about, 
        :description_us, :school, :description_interested, :description_pr, :age, :facebook, :twitter, :image
        ])
  end
end
