module Members
  class AdminUserSessionsController < Members::MembersController
    
    skip_before_filter :authorise, :only => [:new, :create]
    before_filter :requires_no_session_user, :except => [:destroy]
  
    layout 'members_auth'
  
    def new
      @admin_user_session = Members::AdminUserSession.new
    end
  
    def create
      @admin_user_session = Members::AdminUserSession.new params[:members_admin_user_session]
      if @admin_user_session.save
        redirect_back_or_default :controller => :members, :action => :index
      else
        render :action => :new
      end
    end
  
    def destroy
      current_admin_user_session.destroy
      redirect_back_or_default new_members_admin_user_session_url
    end

  private
  
    def requires_no_session_user
      if current_user
        redirect_to :controller => :members, :action => :index
      end
    end

  end
end