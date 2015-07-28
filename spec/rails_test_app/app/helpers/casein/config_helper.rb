module Members
  module ConfigHelper
    
    # Name of website or client — used throughout Members.
    def members_config_website_name
      'Members'
    end

    # Filename of logo image. Ideally, it should be a transparent PNG around 140x30px
    def members_config_logo
      'members/members.png'
    end

    # The server hostname where Members will run
    def members_config_hostname
      if Rails.env.production?
        'http://www.memberscms.com'
      else
        'http://0.0.0.0:3000'
      end
    end

    # The sender address used for email notifications
    def members_config_email_from_address
      'donotreply@memberscms.com'
    end
  
    # The initial page the user is shown after they sign in or click the logo. Probably this should be set to the first tab.
    # Do not point this at members/index!
    def members_config_dashboard_url
      url_for :controller => :members, :action => :blank
    end
  
    # A list of stylesheets to include. Do not remove the core members/members, but you can change the load order, if required.
    def members_config_stylesheet_includes
      %w[members/members members/custom]
    end
  
    # A list of JavaScript files to include. Do not remove the core members/members, but you can change the load order, if required.
    def members_config_javascript_includes
      %w[members/members members/custom]
    end
    
  end
end