module ImageHelpers
  # usage <%= inline_svg("logo"); %> assuming logo.svg is stored at source/images/svg/logo.svg
  def inline_svg(filename, options = {})
    asset = "source/images/#{filename}.svg"

    if File.exists?(asset)
      file = File.open(asset, 'r') { |f| f.read }
      css_class = options[:class]
      return file if css_class.nil?

      document = Oga.parse_xml(file)
      svg      = document.css('svg').first

      svg.set(:class, css_class)

      document.to_xml
    else
      %(
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 30"
          width="400px" height="30px"
        >
          <text font-size="16" x="8" y="20" fill="#cc0000">
            Error: '#{filename}' could not be found.
            Looked in: '#{asset}'
          </text>
          <rect
            x="1" y="1" width="398" height="28" fill="none"
            stroke-width="1" stroke="#cc0000"
          />
        </svg>
      )
    end
  end
end