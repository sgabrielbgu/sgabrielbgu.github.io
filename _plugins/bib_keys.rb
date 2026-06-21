require 'bibtex'
require 'cgi'

class BibKeysTag < Liquid::Tag
  def initialize(tag_name, markup, tokens)
    super
    @raw_markup = markup.strip
  end

  def resolve_keys(context)
    rendered = Liquid::Template.parse(@raw_markup).render(context)
    rendered.strip.split(/[\s,]+/).reject(&:empty?)
  end

  def render(context)
    keys = resolve_keys(context)
    site = context.registers[:site]
    config = site.config['scholar'] || {}
    source_dir = config['source'] || '_bibliography'
    bib_name = config['bibliography'] || 'papers.bib'
    bib_file = File.join(site.source, source_dir, bib_name)

    return "<!-- bib file not found: #{bib_file} -->" unless File.exist?(bib_file)

    bib = BibTeX.open(bib_file)

    entries_by_year = {}
    keys.each do |key|
      entry = bib[key.to_sym]
      next unless entry
      year = entry[:year].to_s
      entries_by_year[year] ||= []
      entries_by_year[year] << entry
    end

    return '' if entries_by_year.empty?

    html = ''
    entries_by_year.sort_by { |y, _| -y.to_i }.each do |year, entries|
      html << "<h2 class=\"bibliography\">#{year}</h2>\n"
      html << "<ol class=\"bibliography\">\n"
      entries.each do |entry|
        html << render_entry(entry)
      end
      html << "</ol>\n"
    end
    html
  end

  private

  def render_entry(entry)
    key = entry.key.to_s
    title = clean(entry[:title])
    authors = format_authors(entry[:author].to_s)
    venue = format_venue(entry)
    year = entry[:year].to_s
    abbr = clean(entry[:abbr]) if entry[:abbr]

    li = "<li>\n<div class=\"row\">\n"

    if abbr && !abbr.empty?
      li << "  <div class=\"col col-sm-2 abbr\">\n"
      li << "    <abbr class=\"badge rounded w-100\">#{h abbr}</abbr>\n"
      li << "  </div>\n"
    end

    li << "  <div id=\"#{h key}\" class=\"col-sm-8\">\n"
    li << "    <div class=\"title\">#{h title}</div>\n"
    li << "    <div class=\"author\">#{authors}</div>\n"
    li << "    <div class=\"periodical\"><em>#{h venue}</em>, #{h year}</div>\n"

    links = []
    if entry[:abstract] && !entry[:abstract].to_s.strip.empty?
      links << "<a class=\"abstract btn btn-sm z-depth-0\" role=\"button\">Abs</a>"
    end
    if entry[:bibtex_show]
      links << "<a class=\"bibtex btn btn-sm z-depth-0\" role=\"button\">Bib</a>"
    end
    unless links.empty?
      li << "    <div class=\"links\">#{links.join("\n")}</div>\n"
    end

    if entry[:abstract] && !entry[:abstract].to_s.strip.empty?
      li << "    <div class=\"abstract hidden\"><p>#{h clean(entry[:abstract])}</p></div>\n"
    end
    if entry[:bibtex_show]
      li << "    <div class=\"bibtex hidden\"><figure class=\"highlight\"><pre><code class=\"language-bibtex\" data-lang=\"bibtex\">#{h entry.to_s}</code></pre></figure></div>\n"
    end

    li << "  </div>\n"
    li << "</div>\n</li>\n"
    li
  end

  def format_authors(author_str)
    names = author_str.split(' and ').map(&:strip)
    formatted = names.map do |name|
      parts = name.split(',').map(&:strip)
      if parts.length == 2
        display = "#{parts[1][0]}. #{parts[0]}"
      else
        display = name
      end
      if name.include?('Scalosub')
        "<em>#{h display}</em>"
      else
        h(display)
      end
    end
    formatted.length > 1 ? formatted[0..-2].join(', ') + ', and ' + formatted[-1] : formatted[0].to_s
  end

  def format_venue(entry)
    if entry[:journal]
      clean(entry[:journal])
    elsif entry[:booktitle]
      clean(entry[:booktitle])
    else
      ''
    end
  end

  def clean(val)
    val.to_s.gsub(/[{}]/, '')
  end

  def h(str)
    CGI.escapeHTML(str.to_s)
  end
end

Liquid::Template.register_tag('bibliography_keys', BibKeysTag)

class BibThemeTag < BibKeysTag
  def initialize(tag_name, markup, tokens)
    @theme_name = markup.strip
    # skip BibKeysTag's init which parses keys
    Liquid::Tag.instance_method(:initialize).bind_call(self, tag_name, markup, tokens)
  end

  def render(context)
    site = context.registers[:site]
    config = site.config['scholar'] || {}
    source_dir = config['source'] || '_bibliography'
    bib_name = config['bibliography'] || 'papers.bib'
    bib_file = File.join(site.source, source_dir, bib_name)

    return "<!-- bib file not found -->" unless File.exist?(bib_file)

    bib = BibTeX.open(bib_file)

    entries_by_year = {}
    bib.each do |entry|
      next unless entry.respond_to?(:key)
      themes_val = entry[:themes].to_s.gsub(/[{}]/, '').strip
      next if themes_val.empty?
      themes = themes_val.split(/\s*,\s*/)
      next unless themes.include?(@theme_name)
      year = entry[:year].to_s
      entries_by_year[year] ||= []
      entries_by_year[year] << entry
    end

    return '' if entries_by_year.empty?

    html = ''
    entries_by_year.sort_by { |y, _| -y.to_i }.each do |year, entries|
      html << "<h2 class=\"bibliography\">#{year}</h2>\n"
      html << "<ol class=\"bibliography\">\n"
      entries.each do |entry|
        html << render_entry(entry)
      end
      html << "</ol>\n"
    end
    html
  end
end

Liquid::Template.register_tag('bibliography_theme', BibThemeTag)
