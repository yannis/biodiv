module ApplicationHelper
    
  def javascript(*files)
    content_for(:javascript) { javascript_include_tag(*files)}
  end
  
  def stylesheet(*files)
    content_for(:stylesheet) { stylesheet_link_tag(*files)}
  end
  
  def document_ready(content)
    content_for(:document_ready){ 
      javascript_tag do
        content
      end  
    }
  end
  
  def controller?(*controller)
    controller.map{|a| a.to_s }.include?(params[:controller].to_s)
  end
  
  def action?(*action)
    action.map{|a| a.to_s }.include?(params[:action].to_s)
  end
  
  
    ########### from https://github.com/sporkd/compass-html5-boilerplate #########################
  
  def ie_tag(name=:body, attrs={}, &block)
    attrs.symbolize_keys!
    haml_concat("<!--[if lt IE 7 ]> #{ tag(name, add_class('ie6', attrs), true) } <![endif]-->".html_safe)
    haml_concat("<!--[if IE 7 ]>    #{ tag(name, add_class('ie7', attrs), true) } <![endif]-->".html_safe)
    haml_concat("<!--[if IE 8 ]>    #{ tag(name, add_class('ie8', attrs), true) } <![endif]-->".html_safe)
    haml_concat("<!--[if IE 9 ]>    #{ tag(name, add_class('ie9', attrs), true) } <![endif]-->".html_safe)
    haml_concat("<!--[if (gte IE 9)|!(IE)]><!-->".html_safe)
    haml_tag name, attrs do
      haml_concat("<!--<![endif]-->".html_safe)
      block.call
    end
  end  

  def ie_html(attrs={}, &block)
    ie_tag(:html, attrs, &block)
  end
  
  private

   def add_class(name, attrs)
    classes = attrs[:class] || ''
    classes.strip!
    classes = ' ' + classes if !classes.blank?
    classes = name + classes
    attrs.merge(:class => classes)
  end
end
