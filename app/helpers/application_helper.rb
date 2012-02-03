module ApplicationHelper
  def conditional_html(lang = "en", &block)
    # see http://gf3.ca/2011/02/12/conditional-html-tag-haml for technique used
    header = <<-"HTML"
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if lt IE 7]><html class="no-js ie6 oldie" lang="en"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" lang="en"><!--<![endif]-->
<!--[if (gte IE 9)|(gt IEMobile 7)]><!--><html class="no-js" lang="en"><!--<![endif]-->
    HTML
    haml_concat header.html_safe
    if block_given?
      yield
      haml_concat "\n</html>".html_safe
    end
    true
  end

  def render_slide(header, content, image, slide_class, url)
    render partial: 'shared/slide', locals: { slide_class: slide_class,
      header: header, content: content, image: image, url: url }
  end

  def render_project(title, image, url, description)
    render partial: 'shared/project', locals: { title: title, image: image, url: url, description: description }
  end

  def interior_header(text)
    render partial: 'shared/interior_header', :locals => { text: text }
  end

  def render_sibling_nav_for(subsection)
    page_arr = []
    case subsection
    when :services
      page_arr << ["Financial", services_financial_path]
      page_arr << ["Phase Zero", services_phasezero_path]
      page_arr << ["E-Commerce", services_ecommerce_path]
      page_arr << ["Social Media", services_socialmedia_path]
      page_arr << ["Insurance", services_insurance_path]
      page_arr << ["Mobile", services_mobile_path]
      page_arr << ["SaaS", services_saas_path]
      page_arr << ["MLM", services_mlm_path]
    when :community
      page_arr << ["Xrono", '/community/xrono']
      page_arr << ['RubyHam', '/community/rubyham']
      page_arr << ['state_machine_audits', '/community/state_machine_audits']
      page_arr << ['TechBirmingham', '/community/techbirmingham']
      page_arr << ['contract_acceptance_framework', '/community/contract_acceptance_framework']
      page_arr << ['bootstrap-will_paginate', '/community/bootstrap_will_paginate']
      page_arr << ['css3_progress_bar_rails', '/community/css3_progress_bar_rails']
      page_arr << ['isotope_contacts', '/community/isotope_contacts']
    end
    return '' if page_arr.empty?
    render partial: 'shared/sibling_nav', locals: { pages: page_arr }
  end

  def tab_for(type, name, link, key, extra_classes='')
    state = @tab == key ? 'active' : ''
    content_tag(:li, :class => [state, type, extra_classes].join(" ")) do
      link_to name, link
    end
  end

  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      lang = $2 || 'ruby'
      CodeRay.scan($3, lang).div(:css => :class)
    end
  end

  def facebook_like(url)
    content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=false&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
  end

  def share_this
    render :partial => 'shared/sharethis'
  end
end
