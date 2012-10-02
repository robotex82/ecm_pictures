module MarkupHelper
  def mu(object, method)
    handler = object.send(method)
    erb_string = ::ERB.new(object[method.to_sym].to_s, 0).result(binding())
    return handler.class.new(erb_string).to_html.html_safe
  end  
end
