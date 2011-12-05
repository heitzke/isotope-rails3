class IncomingMailsController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    @message = Mail.new(params[:message])

    if is_blog_post? && is_by_authorized_user?
      generate_blog_post
    end

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end

  protected
  def generate_blog_post
    @post = Post.new
    @post.user = blog_post_user
    @post.title = blog_post_title
    @post.body = blog_post_body
    @post.save
  end

  def is_blog_post?
    @message.subject =~ blog_post_identification_regex
  end

  def is_by_authorized_user?
    blog_post_user
  end

  def blog_post_user
    @user ||= User.find_by_email(@message.from[0])
  end

  def blog_post_title
    @message.subject.gsub(blog_post_identification_regex, '').strip
  end

  def blog_post_body
    RDiscount.new(@message.parts.first.body.to_s).to_html
  end

  def blog_post_identification_regex
    /\[BLOG\]/
  end
end
