# jekyll-cache-bust's bust_css_cache hashes files under "assets/_sass", which doesn't
# exist in this theme -- the actual Sass partials live at the project-root "_sass/".
# That made the hash a constant (MD5 of an empty file list), so main.css's cache-busting
# query string never changed across rebuilds and browsers kept serving stale CSS forever.
# Re-opening the module here (loads after the gem, per Jekyll's plugin load order) to
# point it at the correct directory.
module Jekyll
  module CacheBust
    def bust_css_cache(file_name)
      CacheDigester.new(file_name: file_name, directory: "_sass").digest!
    end
  end
end
