xml.instruct! :xml, :version=> '1.0' 
xml.rss :version=>'2.0' do
  xml.channel do
    xml.title("anamonster: blog")
    xml.link(url_for(:only_path => false, :controller => 'blogs', :action => 'feed'))
    xml.description("Know all there is to know in anamonster's world")
    @blogs.each do |blog|
      xml.item do
        xml.title(blog.title)
        xml.link(blog_path(blog, :only_path => false))
        xml.description(truncate(strip_tags(markdown(blog.image_replaced_content)), 300))
        xml.pubDate(blog.created_at.to_s(:rfc822))
        xml.guid(blog_path(blog, :only_path => false))
      end
    end
  end
end
