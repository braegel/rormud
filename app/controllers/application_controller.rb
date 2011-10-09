class ApplicationController < ActionController::Base
  before_filter :set_locale

  def authorize(vars)
    concat = Array.new
    if User.exists?(session[:user_id]) && session[:user_id]
      User.find(session[:user_id]).roles.each do |role|
        concat << role
      end
      vars[:required_user_roles].each do |role|
        concat << role
      end
      unless User.find(session[:user_id]) && concat.uniq.size < concat.size
        redirect_to login_path, :notice => I18n.translate(:restricted_access)
      end
    else
      redirect_to login_path, :notice => I18n.translate(:restricted_access)
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
