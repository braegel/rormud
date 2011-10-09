class ApplicationController < ActionController::Base
  before_filter :set_locale
  before_filter :authorize
  
  def authorize
    unless User.find_by_id(session[:user_id])
    redirect_to login_url, :notice => I18n.translate(:please_log_in)
    end
  end


  def set_locale
    I18n.default_locale
    if params[:locale]
        I18n.locale = params[:locale]
      elsif extract_locale_from_accept_language_header
         I18n.locale = extract_locale_from_accept_language_header
       end
    end
    
    def default_url_options(options={})
      { :locale => I18n.locale }
    end
    
  protected

  def default_url_options
    { :locale => I18n.locale }
  end

  private
  def extract_locale_from_accept_language_header
    if request.env['HTTP_ACCEPT_LANGUAGE'] != nil
      return request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
  end
  
  protect_from_forgery

end
