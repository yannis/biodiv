class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    if flash
      notice = notice
      alert = alert
    end
    default_locale = 'fr'
    begin
      request_language = request.env['HTTP_ACCEPT_LANGUAGE'].split('-')[0]
      request_language = (request_language.nil? || !['en', 'fr'].include?(request_language[/[^,;]+/])) ? nil : request_language[/[^,;]+/]
      params_locale = params[:locale] if params[:locale] == 'en' or params[:locale] == 'fr'

      @locale = params_locale || session[:locale] || request_language || default_locale
      I18n.locale = session[:locale] = @locale

      @inverse_locale = (@locale == 'en' ? 'fr' : 'en')

    rescue
      I18n.locale = session[:locale] = default_locale
    end
  end

end
