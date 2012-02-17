module ApplicationHelper
  def conditional_html(lang = "en", &block)
    # see http://gf3.ca/2011/02/12/conditional-html-tag-haml for technique used
    header = <<-"HTML"
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if lt IE 7]><html class="no-js ie6 oldie" lang="en"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" lang="en"><!--<![endif]-->
<!--[if (gte IE 9)|(gt IEMobile 7)|!(IE)]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
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
    content_for :top_area do
      render partial: 'shared/interior_header', :locals => { text: text }
    end
  end

  def community_list_items
    cli = ActiveSupport::OrderedHash.new
    cli.merge!({
      "Xrono" => {
        :path => '/community/xrono',
        :image => 'feature_xrono.png',
        :description => "Track your company's time and profitability with our open source project, Xrono"
        },
      "isotope_contacts" => {
        :path => '/community/isotope_contacts',
        :image => 'ruby.png',
        :description => "is a gem that provides drop-in contact management for your rails app"
        },
      "bootstrap-will_paginate" => {
        :path => '/community/bootstrap_will_paginate',
        :image => 'ruby.png',
        :description => "is a gem that works with the Twitter Bootstrap and Will Paginate libraries."
        },
      "css3_progress_bar_rails" => {
        :path => '/community/css3_progress_bar_rails',
        :image => 'ruby.png',
        :description => "is a gem that generates progress bars in css"
        },
      "quote_app" => {
        :path => '/community/quote_app',
        :image => 'ruby.png',
        :description => "is a rails app for estimating software projects and exporting PDFs."
        },
      "contract_acceptance_framework" => {
        :path => '/community/contract_acceptance_framework',
        :image => 'ruby.png',
        :description => "is a gem that allows rails objects to agree to versioned contracts."
        },
      "RubyHam" =>  {
        :path => '/community/rubyham',
        :image => 'feature_xrono.png',
        :description => "Meet and learn with other Ruby professionals and enthusiasts in the greater Birmingham area."
        },
      "TechBirmingham" => {
        :path => '/community/techbirmingham',
        :image => 'feature_xrono.png',
        :description => "isotope|eleven is a silver sponsor for TechBirmingham..."
        },
      "state_machine_audits" => {
        :path => '/community/state_machine_audits',
        :image => 'ruby.png',
        :description => "is a gem intended to be used in conjunction with the state_machine gem..."
        },
      "spree_suppliers_extension" => {
        :path => '/community/spree_suppliers_extension',
        :image => 'ruby.png',
        :description => 'is a ruby gem and "extension" for the popular ruby on rails ecommerce engine, Spree.' },
      "data_science_theater_3000" => {
        :path => '/community/data_science_theater_3000',
        :image => 'ruby.png',
        :description => "is a gem for interacting with the APIs in the DataScienceToolkit"
      }
    })
  end

  def services_list_items
    cli = ActiveSupport::OrderedHash.new
    cli.merge!({
      "Financial" => {
        :description => "We architected, developed, and maintained one of the largest Ruby-based financial applications in the world.",
        :image       => "ecom_bag.png",
        :css_class   => "slide5",
        :path        => services_financial_path
      },
      "Phase Zero" => {
        :description => "Where do you start? Just as an architect creates a blueprint before building a house, we do the same for your software project.",
        :image       => "ecom_bag.png",
        :css_class   => "slide1",
        :path        => services_phasezero_path
      },
      "E-Commerce" => {
        :description => "Are you ready to move beyond a basic webpage?  Let us help you get your store online.",
        :image       => "ecom_bag.png",
        :css_class   => "slide2",
        :path        => services_ecommerce_path
      },
      "Social Media" => {
        :description => "Social Media is about more than just buzz.  Work with a team that knows the ins and outs of the business.",
        :image       => "ecom_bag.png",
        :css_class   => "slide3",
        :path        => services_socialmedia_path
      },
      "Insurance" => {
        :description => "We've built multiple insurance calculators that are in daily use writing thousands of policies.",
        :image       => "ecom_bag.png",
        :css_class   => "slide6",
        :path        => services_insurance_path
      },
      "Mobile" => {
        :description => "We have experience building mobile apps and mobile websites, as well as the APIs that power them.",
        :image       => "ecom_bag.png",
        :css_class   => "slide2",
        :path        => services_mobile_path
      },
      "SaaS" => {
        :description => "Software-as-a-service isn't just about recurring revenue.  Let us help you with your subscription model.",
        :image       => "ecom_bag.png",
        :css_class   => "slide7",
        :path        => services_saas_path
      },
      "MLM" => {
        :description => "Need multi-level marketing?  We have the complete solution, and plenty of experience.",
        :image       => "ecom_bag.png",
        :css_class   => "slide4",
        :path        => services_mlm_path
      }
    })
  end

  def render_sibling_nav_for(subsection)
    page_arr = []
    case subsection
    when :services
      services = services_list_items
      services.each_key { |k| page_arr << [k, services[k][:path]] }
    when :community
      community_projects = community_list_items
      community_projects.each_key { |k| page_arr << [k, community_projects[k][:path]] }
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
