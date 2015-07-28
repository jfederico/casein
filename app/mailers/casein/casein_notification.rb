module Members
  
  class MembersNotification < ActionMailer::Base
	
  	self.prepend_view_path File.join(File.dirname(__FILE__), '..', 'views', 'members')
	
  	def generate_new_password from, members_admin_user, host, pass
  		@name = members_admin_user.name
  		@host = host
  		@login = members_admin_user.login
  		@pass = pass
  		@from_text = members_config_website_name
  		
  		mail(:to => members_admin_user.email, :from => from, :subject => "[#{members_config_website_name}] New password")
  	end
  
  	def new_user_information from, members_admin_user, host, pass
      @name = members_admin_user.name
  		@host = host
  		@login = members_admin_user.login
  		@pass = pass
  		@from_text = members_config_website_name
  		
  		mail(:to => members_admin_user.email, :from => from, :subject => "[#{members_config_website_name}] New user account")
  	end
  	
  	def password_reset_instructions from, members_admin_user, host
  	  ActionMailer::Base.default_url_options[:host] = host.gsub("http://", "")
      @name = members_admin_user.name
      @host = host
      @login = members_admin_user.login
      @reset_password_url = edit_members_password_reset_url + "/?token=#{members_admin_user.perishable_token}"
      @from_text = members_config_website_name

      mail(:to => members_admin_user.email, :from => from, :subject => "[#{members_config_website_name}] Password reset instructions")
    end

  end
end