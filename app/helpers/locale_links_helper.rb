module LocaleLinksHelper
  def locale_links
    return link_to (@inverse_locale == 'fr' ? 'français' : 'english'), {locale: @inverse_locale}, {class: "pull-right locale-links"}
  end
end
