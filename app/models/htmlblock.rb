class Htmlblock
  ALLOWED_HTML_TAGS = ["table", "iframe", "tr", "td", "th", "col", "pre", "p", "h1", "h2", "h3", "summary", "details", "row", "code"]
  ALLOWED_HTML_ATTRIBUTES = []

  # To Validate HTML tags and protect from bad formatted input
  def self.validate(html)
    errors = []
    html = Nokogiri::HTML::DocumentFragment.parse(html)
    html.search("pre").each do |pre_tag|
      pre_tag_html, pre_tag_errors = self.ensure_well_formed_markup(pre_tag.text)
      errors.push(pre_tag_errors) unless pre_tag_errors.empty?
      inner_html = self.extract_inner_html_from_pre_tag(pre_tag_html)
      inner_html = self.remove_not_allowed_tags_and_attributes(inner_html)
      pre_tag.children.first.replace(Nokogiri::XML::Text.new(
        inner_html,
        pre_tag
      ))
    end
    html = ActionText::Fragment.new(html)
    [html.to_html, errors.flatten.uniq]
  end

  # To parse each code block tag and render it to HTML
  def self.render(rich_text)
    html = Nokogiri::HTML::DocumentFragment.parse(rich_text)
    html.search("pre").each do |pre_tag|
      inner_html = Nokogiri::HTML::DocumentFragment.parse(pre_tag.text)
      inner_html = add_styles_to_tables(inner_html)
      advanced_code_block = "<div class='advanced-code-block'>#{inner_html.to_html}</div>"
      pre_tag.replace(advanced_code_block)
    end
    html.to_html
  end

  private

  def self.ensure_well_formed_markup(html)
    parsed = Nokogiri::XML("<pre>#{html}</pre>")
    [parsed, parsed.errors]
  end

  # To add our bootstrap specific classes to table elements
  def self.add_styles_to_tables(html)
    html.search("table").each do |table|
      table["class"] = "table"
      table.wrap("<div class='table-responsive'></div>")
    end
    html
  end

  def self.extract_inner_html_from_pre_tag(html)
    Nokogiri::XML(html.at("pre").inner_html)
  end

  # To add error messages to mis-formatted HTML
  def self.error_messages(errors)
    readable_message = ->(e) { e.message.split(":")[3].strip rescue "" }
    errors.map {|e| readable_message.call(e) }.uniq.join(", ")
  end
end