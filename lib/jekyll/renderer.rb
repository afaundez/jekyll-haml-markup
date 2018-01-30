require 'jekyll/renderer'

module Jekyll
  class Renderer
    def render_document
      info = {
        :registers => { :site => site, :page => payload["page"] },
      }
      output = document.content

      if document.render_with_haml?
        Jekyll.logger.debug "Rendering Haml:", document.relative_path
        output = render_haml(output, payload, info, document.path)
      end

      if document.render_with_liquid?
        Jekyll.logger.debug "Rendering Liquid:", document.relative_path
        output = render_liquid(output, payload, info, document.path)
      end

      Jekyll.logger.debug "Rendering Markup:", document.relative_path
      output = convert(output)
      document.content = output

      if document.place_in_layout?
        Jekyll.logger.debug "Rendering Layout:", document.relative_path
        output = place_in_layouts(output, payload, info)
      end

      output
    end

    def render_haml(content, payload, info, path = nil)
      template = site.haml_renderer.file(path).parse(content)
      template.warnings.each do |e|
        Jekyll.logger.warn "Haml Warning:",
          HamlRenderer.format_error(e, path || document.relative_path)
      end
      template.render!(payload, info)
    end

    private
    def render_layout(output, layout, info)
      payload["content"] = output
      payload["layout"]  = Utils.deep_merge_hashes(layout.data, payload["layout"] || {})

      if layout.render_with_haml?
        Jekyll.logger.debug "Rendering Haml:", layout.relative_path
        layout.content = ::Haml::Engine.new(layout.content).render
      end

      render_liquid(
        layout.content,
        payload,
        info,
        layout.relative_path
      )
    end
  end
end
