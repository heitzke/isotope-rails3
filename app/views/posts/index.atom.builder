atom_feed do |feed|
  feed.title("isotope|eleven Blog")
  feed.updated(@posts.first.created_at)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(RDiscount.new(post.body).to_html, :type => 'html')
      entry.author { |author| author.name(post.user) }
    end
  end
end
