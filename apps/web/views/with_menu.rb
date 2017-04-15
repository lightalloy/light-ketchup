module Web::Views
  module WithMenu
    def self.included(view)
      view.class_eval do
        # menu_class(route)
        def menu_link(label, route)
          html do
            li(class: menu_class(route)) do
              link_to label, route
            end
          end
        end

        def menu_class(route)
          path = params.env['SCRIPT_NAME']
          path += "?#{params.env['QUERY_STRING']}" unless params.env['QUERY_STRING'].empty?
          path == route ? 'is-active' : 'is-inactive'
        end
      end
    end
  end
end