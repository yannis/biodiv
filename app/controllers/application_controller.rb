class ApplicationController < ActionController::Base
  
  before_filter :set_locale
  
  protect_from_forgery
  
  protected
  
  def set_locale
    default_locale = 'en'
    begin
      request_language = request.env['HTTP_ACCEPT_LANGUAGE'].split('-')[0]
      request_language = (request_language.nil? || !['en', 'fr'].include?(request_language[/[^,;]+/])) ? nil : request_language[/[^,;]+/]
      params_locale = params[:locale] if params[:locale] == 'en' or params[:locale] == 'fr'

      @locale = params_locale || session[:locale] || request_language || default_locale
      I18n.locale = session[:locale] = @locale
    
    rescue
      I18n.locale = session[:locale] = default_locale
    end
  end
  
  def default_url_options(options={})
   {:locale => I18n.locale}
  end
end
