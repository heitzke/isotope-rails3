module ApplicationHelper
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      lang = $2 || 'ruby'
      CodeRay.scan($3, lang).div(:css => :class)
    end
  end
end
