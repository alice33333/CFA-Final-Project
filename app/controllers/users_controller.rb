class UsersController < ApplicationController
  
  # Permissions
  before_action :logged_in_user, only: []
  before_action :correct_user,   only: []
  before_action :admin_user, only: [:index, :edit, :new, :all, :faverage, :baverage, :reset]
  before_action :second_tier_user, only: [:front, :back]
  before_action :manager_user, only: [:manager]
  
  def index
    @users = User.all
  end 

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  # Back of House evaluation form (for BOH shift leaders)
  def back
    @users = User.order("name").where.not(:role => 0).where.not(:role => 1).where.not(:role => 4).where.not(:role => 3).page(params[:page]).per(1)
  end
  
  # Front of House evaluation form (for FOH shift leaders)
  def front
   
   @users = User.order("name").where.not(:role => 0).where.not(:role => 2).where.not(:role => 5).where.not(:role => 3).page(params[:page]).per(1)
  end
  
  # All evaluation form (for directors)
  def all
    @users = User.order("name").where.not(:role => 0).page(params[:page]).per(1)
  end
  
  # All evaluation form (for managers)
  def manager
    @users = User.order("name").where.not(:role => 0).page(params[:page]).per(1)
  end
  
  def faverage
    @users = User.order(overall: :desc)
  end
  
  def baverage
     @users = User.order(overall: :desc)
  end
  
  def reset
   @user = current_user
  end
  
  def create
    @user = User.new(user_params)
    
    # MAKE DEFAULT IN DATABASE CREATION AND TRY TO ADD USER_PARAMS
      if @user.save
        
      if @user.role == 1 || @user.role == 2 || @user.role == 3 || @user.role == 4 || @user.role == 5
        @user.update_attribute :question_one, 0.0
        @user.update_attribute :question_two, 0.0
        @user.update_attribute :question_three, 0.0
        @user.update_attribute :question_four, 0.0
        @user.update_attribute :question_five, 0.0
        @user.update_attribute :one_counter, 0
        @user.update_attribute :two_counter, 0
        @user.update_attribute :three_counter, 0
        @user.update_attribute :four_counter, 0
        @user.update_attribute :five_counter, 0
        
        @user.update_attribute :extra_one, 0.0
        @user.update_attribute :extra_two, 0.0
        @user.update_attribute :extra_three, 0.0
        @user.update_attribute :extra_four, 0.0
        @user.update_attribute :extra_five, 0.0
        @user.update_attribute :extra_one_counter, 0
        @user.update_attribute :extra_two_counter, 0
        @user.update_attribute :extra_three_counter, 0
        @user.update_attribute :extra_four_counter, 0
        @user.update_attribute :extra_five_counter, 0
      end
      
        
        if @user.role == 0 
          @user.update_attribute :admin, true
          @user.update_attribute :extra_one, nil
          @user.update_attribute :extra_two, nil
          @user.update_attribute :extra_three, nil
          @user.update_attribute :extra_four, nil
          @user.update_attribute :extra_five, nil
        end
        if @user.role == 4 || @user.role == 5
          @user.update_attribute :leader, true
        end
        if @user.role == 3
          @user.update_attribute :manager, true
        end
        if @user.role == 1 || @user.role == 2
          @user.update_attribute :leader, false
          @user.update_attribute :manager, false
        end
      
        flash[:success] = "Team Member successfully Created!"
        redirect_to users_url
      else
        render 'new'
      end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  #question_one = final result
  #current_one = current result
  #total_one = all the results
  def update
    @users = User.all
    @user = User.find(params[:id])
    average = 0
    
    if @user.update_attributes(user_params)
      @user.update_attribute :flag, true
      flash[:success] = "Profile updated"
      
      
      # QUESTION ONE: HUNGER FOR WISDOM
      if @user.current_one == 1 
          @user.increment(:one_counter, 1)
          @user.save
          @user.increment(:total_one, 1)
          average = (@user.total_one / @user.one_counter)
          @user.update_attribute :question_one, average
      end
      if @user.current_one == 2
          @user.increment(:one_counter, 1)
          @user.save
          @user.increment(:total_one, 2)
          average = (@user.total_one / @user.one_counter)
          @user.update_attribute :question_one, average
      end
      if @user.current_one == 3 
          @user.increment(:one_counter, 1)
          @user.save
          @user.increment(:total_one, 3)
          average = (@user.total_one / @user.one_counter)
          @user.update_attribute :question_one, average
      end
      if @user.current_one == 4
          @user.increment(:one_counter, 1)
          @user.save
          @user.increment(:total_one, 4)
          average = (@user.total_one / @user.one_counter)
          @user.update_attribute :question_one, average
      end
      if @user.current_one == 5
          @user.increment(:one_counter, 1)
          @user.save
          @user.increment(:total_one, 5)
          average = (@user.total_one / @user.one_counter)
          @user.update_attribute :question_one, average
      end
      
      # QUESTION TWO: EXPECT THE BEST
      average1 = 0
      if @user.current_two == 1 
          @user.increment(:two_counter, 1)
          @user.save
          @user.increment(:total_two, 1)
          average1 = (@user.total_two / @user.two_counter)
          @user.update_attribute :question_two, average1
      end
      if @user.current_two == 2
          @user.increment(:two_counter, 1)
          @user.save
          @user.increment(:total_two, 2)
          average1 = (@user.total_two / @user.two_counter)
          @user.update_attribute :question_two, average1
      end
      if @user.current_two == 3 
          @user.increment(:two_counter, 1)
          @user.save
          @user.increment(:total_two, 3)
          average1 = (@user.total_two / @user.two_counter)
          @user.update_attribute :question_two, average1
      end
      if @user.current_two == 4
          @user.increment(:two_counter, 1)
          @user.save
          @user.increment(:total_two, 4)
          average1 = (@user.total_two / @user.two_counter)
          @user.update_attribute :question_two, average1
      end
      if @user.current_two == 5
          @user.increment(:two_counter, 1)
          @user.save
          @user.increment(:total_two, 5)
          average1 = (@user.total_two / @user.two_counter)
          @user.update_attribute :question_two, average1
      end
      
      # QUESTION THREE: ACCEPT RESPONSIBILITY
      average2 = 0
      if @user.current_three == 1 
          @user.increment(:three_counter, 1)
          @user.save
          @user.increment(:total_three, 1)
          average2 = (@user.total_three / @user.three_counter)
          @user.update_attribute :question_three, average2
      end
      if @user.current_three == 2
          @user.increment(:three_counter, 1)
          @user.save
          @user.increment(:total_three, 2)
          average2 = (@user.total_three / @user.three_counter)
          @user.update_attribute :question_three, average2
      end
      if @user.current_three == 3 
          @user.increment(:three_counter, 1)
          @user.save
          @user.increment(:total_three, 3)
          average2 = (@user.total_three / @user.three_counter)
          @user.update_attribute :question_three, average2
      end
      if @user.current_three == 4
          @user.increment(:three_counter, 1)
          @user.save
          @user.increment(:total_three, 4)
          average2 = (@user.total_three / @user.three_counter)
          @user.update_attribute :question_three, average2
      end
      if @user.current_three == 5
          @user.increment(:three_counter, 1)
          @user.save
          @user.increment(:total_three, 5)
          average2 = (@user.total_three / @user.three_counter)
          @user.update_attribute :question_three, average2
      end
      
      # QUESTION FOUR: RESPOND WITH COURAGE
      average3 = 0
      if @user.current_four == 1 
          @user.increment(:four_counter, 1)
          @user.save
          @user.increment(:total_four, 1)
          average3 = (@user.total_four / @user.four_counter)
          @user.update_attribute :question_four, average3
      end
      if @user.current_four == 2
          @user.increment(:four_counter, 1)
          @user.save
          @user.increment(:total_four, 2)
          average3 = (@user.total_four / @user.four_counter)
          @user.update_attribute :question_four, average3
      end
      if @user.current_four == 3 
          @user.increment(:four_counter, 1)
          @user.save
          @user.increment(:total_four, 3)
          average3 = (@user.total_four / @user.four_counter)
          @user.update_attribute :question_four, average3
      end
      if @user.current_four == 4
          @user.increment(:four_counter, 1)
          @user.save
          @user.increment(:total_four, 4)
          average3 = (@user.total_four / @user.four_counter)
          @user.update_attribute :question_four, average3
      end
      if @user.current_four == 5
          @user.increment(:four_counter, 1)
          @user.save
          @user.increment(:total_four, 5)
          average3 = (@user.total_four / @user.four_counter)
          @user.update_attribute :question_four, average3
      end
      
      # QUESTION FIVE: THINK OTHERS FIRST
      average4 = 0
      if @user.current_five == 1 
          @user.increment(:five_counter, 1)
          @user.save
          @user.increment(:total_five, 1)
          average4 = (@user.total_five / @user.five_counter)
          @user.update_attribute :question_five, average4
      end
      if @user.current_five == 2
          @user.increment(:five_counter, 1)
          @user.save
          @user.increment(:total_five, 2)
          average4 = (@user.total_five / @user.five_counter)
          @user.update_attribute :question_five, average4
      end
      if @user.current_five == 3 
          @user.increment(:five_counter, 1)
          @user.save
          @user.increment(:total_five, 3)
          average4 = (@user.total_five / @user.five_counter)
          @user.update_attribute :question_five, average4
      end
      if @user.current_five == 4
          @user.increment(:five_counter, 1)
          @user.save
          @user.increment(:total_five, 4)
          average4 = (@user.total_five / @user.five_counter)
          @user.update_attribute :question_five, average4
      end
      if @user.current_five == 5
          @user.increment(:five_counter, 1)
          @user.save
          @user.increment(:total_five, 5)
          average4 = (@user.total_five / @user.five_counter)
          @user.update_attribute :question_five, average4
          #flash[:success] = "Team member's scores were added! Please select 'Next Employee' below to continue"
      end
      
      # EXTRA QUESTION ONE
      average5 = 0
      if @user.current_extra_one == 1 
          @user.increment(:extra_one_counter, 1)
          @user.save
          @user.increment(:total_extra_one, 1)
          average5 = (@user.total_extra_one / @user.extra_one_counter)
          @user.update_attribute :extra_one, average5
      end
      if @user.current_extra_one == 2
          @user.increment(:extra_one_counter, 1)
          @user.save
          @user.increment(:total_extra_one, 2)
          average5 = (@user.total_extra_one / @user.extra_one_counter)
          @user.update_attribute :extra_one, average5
      end
      if @user.current_extra_one == 3 
          @user.increment(:extra_one_counter, 1)
          @user.save
          @user.increment(:total_extra_one, 3)
          average5 = (@user.total_extra_one / @user.extra_one_counter)
          @user.update_attribute :extra_one, average5
      end
      if @user.current_extra_one == 4
          @user.increment(:extra_one_counter, 1)
          @user.save
          @user.increment(:total_extra_one, 4)
          average5 = (@user.total_extra_one / @user.extra_one_counter)
          @user.update_attribute :extra_one, average5
      end
      if @user.current_extra_one == 5
          @user.increment(:extra_one_counter, 1)
          @user.save
          @user.increment(:total_extra_one, 5)
          average5 = (@user.total_extra_one / @user.extra_one_counter)
          @user.update_attribute :extra_one, average5
          #flash[:success] = "Team member's scores were added! Please select 'Next Employee' below to continue"
      end
      
      # EXTRA QUESTION TWO
      average6 = 0
      if @user.current_extra_two == 1 
          @user.increment(:extra_two_counter, 1)
          @user.save
          @user.increment(:total_extra_two, 1)
          average6 = (@user.total_extra_two / @user.extra_two_counter)
          @user.update_attribute :extra_two, average6
      end
      if @user.current_extra_two == 2
          @user.increment(:extra_two_counter, 1)
          @user.save
          @user.increment(:total_extra_two, 2)
          average6 = (@user.total_extra_two / @user.extra_two_counter)
          @user.update_attribute :extra_two, average6
      end
      if @user.current_extra_two == 3 
          @user.increment(:extra_two_counter, 1)
          @user.save
          @user.increment(:total_extra_two, 3)
          average6 = (@user.total_extra_two / @user.extra_two_counter)
          @user.update_attribute :extra_two, average6
      end
      if @user.current_extra_two == 4
          @user.increment(:extra_two_counter, 1)
          @user.save
          @user.increment(:total_extra_two, 4)
          average6 = (@user.total_extra_two / @user.extra_two_counter)
          @user.update_attribute :extra_two, average6
      end
      if @user.current_extra_two == 5
          @user.increment(:extra_two_counter, 1)
          @user.save
          @user.increment(:total_extra_two, 5)
          average6 = (@user.total_extra_two / @user.extra_two_counter)
          @user.update_attribute :extra_two, average6
          #flash[:success] = "Team member's scores were added! Please select 'Next Employee' below to continue"
      end
      
      # EXTRA QUESTION THREE
      average7 = 0
      if @user.current_extra_three == 1 
          @user.increment(:extra_three_counter, 1)
          @user.save
          @user.increment(:total_extra_three, 1)
          average7 = (@user.total_extra_three / @user.extra_three_counter)
          @user.update_attribute :extra_three, average7
      end
      if @user.current_extra_three == 2
          @user.increment(:extra_three_counter, 1)
          @user.save
          @user.increment(:total_extra_three, 2)
          average7 = (@user.total_extra_three / @user.extra_three_counter)
          @user.update_attribute :extra_three, average7
      end
      if @user.current_extra_three == 3 
          @user.increment(:extra_three_counter, 1)
          @user.save
          @user.increment(:total_extra_three, 3)
          average7 = (@user.total_extra_three / @user.extra_three_counter)
          @user.update_attribute :extra_three, average7
      end
      if @user.current_extra_three == 4
          @user.increment(:extra_three_counter, 1)
          @user.save
          @user.increment(:total_extra_three, 4)
          average7 = (@user.total_extra_three / @user.extra_three_counter)
          @user.update_attribute :extra_three, average7
      end
      if @user.current_extra_three == 5
          @user.increment(:extra_three_counter, 1)
          @user.save
          @user.increment(:total_extra_three, 5)
          average7 = (@user.total_extra_three / @user.extra_three_counter)
          @user.update_attribute :extra_three, average7
          #flash[:success] = "Team member's scores were added! Please select 'Next Employee' below to continue"
      end
      
       # EXTRA QUESTION FOUR
      average8 = 0
      if @user.current_extra_four == 1 
          @user.increment(:extra_four_counter, 1)
          @user.save
          @user.increment(:total_extra_four, 1)
          average8 = (@user.total_extra_four / @user.extra_four_counter)
          @user.update_attribute :extra_four, average8
      end
      if @user.current_extra_four == 2
          @user.increment(:extra_four_counter, 1)
          @user.save
          @user.increment(:total_extra_four, 2)
          average8 = (@user.total_extra_four / @user.extra_three_counter)
          @user.update_attribute :extra_four, average8
      end
      if @user.current_extra_four == 3 
          @user.increment(:extra_four_counter, 1)
          @user.save
          @user.increment(:total_extra_four, 3)
          average8 = (@user.total_extra_four / @user.extra_four_counter)
          @user.update_attribute :extra_four, average8
      end
      if @user.current_extra_four == 4
          @user.increment(:extra_four_counter, 1)
          @user.save
          @user.increment(:total_extra_four, 4)
          average8 = (@user.total_extra_four / @user.extra_four_counter)
          @user.update_attribute :extra_four, average8
      end
      if @user.current_extra_four == 5
          @user.increment(:extra_four_counter, 1)
          @user.save
          @user.increment(:total_extra_four, 5)
          average8= (@user.total_extra_four / @user.extra_four_counter)
          @user.update_attribute :extra_four, average8
          #flash[:success] = "Team member's scores were added! Please select 'Next Employee' below to continue"
      end
      
       # EXTRA QUESTION FIVE
      average9 = 0
      if @user.current_extra_five == 1 
          @user.increment(:extra_five_counter, 1)
          @user.save
          @user.increment(:total_extra_five, 1)
          average9 = (@user.total_extra_five / @user.extra_five_counter)
          @user.update_attribute :extra_five, average9
      end
      if @user.current_extra_five == 2
          @user.increment(:extra_five_counter, 1)
          @user.save
          @user.increment(:total_extra_five, 2)
          average9 = (@user.total_extra_five / @user.extra_five_counter)
          @user.update_attribute :extra_five, average9
      end
      if @user.current_extra_five == 3 
          @user.increment(:extra_five_counter, 1)
          @user.save
          @user.increment(:total_extra_five, 3)
          average9 = (@user.total_extra_five / @user.extra_five_counter)
          @user.update_attribute :extra_five, average9
      end
      if @user.current_extra_five == 4
          @user.increment(:extra_five_counter, 1)
          @user.save
          @user.increment(:total_extra_five, 4)
          average9 = (@user.total_extra_five / @user.extra_five_counter)
          @user.update_attribute :extra_five, average9
      end
      if @user.current_extra_five == 5
          @user.increment(:extra_five_counter, 1)
          @user.save
          @user.increment(:total_extra_five, 5)
          average9 = (@user.total_extra_five / @user.extra_five_counter)
          @user.update_attribute :extra_five, average9
          #flash[:success] = "Team member's scores were added! Please select 'Next Employee' below to continue"
      end
      
      if @user.role == 1 || @user.role == 2 || @user.role == 3 || @user.role == 4 || @user.role == 5
      overall = ((@user.question_one + @user.question_two + @user.question_three + @user.question_four + @user.question_five) / 5)
      @user.update_attribute :overall, overall
      end
  
  # ADD ADMIN AND SECOND_TIER UPDATES HERE
      if @user.role == 0 
         @user.update_attribute :admin, true
         @user.update_attribute :leader, false
         @user.update_attribute :manager, false
      end
      if @user.role == 4 || @user.role == 5
         @user.update_attribute :leader, true
         @user.update_attribute :admin, false
         @user.update_attribute :manager, false
      end
      if @user.role == 1 || @user.role == 2
        @user.update_attribute :admin, false
        @user.update_attribute :leader, false
        @user.update_attribute :manager, false
      end
      if @user.role == 3
         @user.update_attribute :manager, true
         @user.update_attribute :admin, false
         @user.update_attribute :leader, false
      end
      
      if @user.role == 0
        if @user.flag == true
           
          @users.update_all(:question_one => 0.0)
          @users.update_all(:one_counter => 0.0)
          @users.update_all(:current_one => 0.0)
          @users.update_all(:total_one => 0.0)
          @users.update_all(:question_two => 0.0)
          @users.update_all(:two_counter => 0.0)
          @users.update_all(:current_two => 0.0)
          @users.update_all(:total_two => 0.0)
          @users.update_all(:question_three => 0.0)
          @users.update_all(:three_counter => 0.0)
          @users.update_all(:current_three => 0.0)
          @users.update_all(:total_three => 0.0)
          @users.update_all(:question_four => 0.0)
          @users.update_all(:four_counter => 0.0)
          @users.update_all(:current_four => 0.0)
          @users.update_all(:total_four => 0.0)
          @users.update_all(:question_five => 0.0)
          @users.update_all(:five_counter => 0.0)
          @users.update_all(:current_five => 0.0)
          @users.update_all(:total_five => 0.0)
          @users.update_all(:extra_one => 0.0)
          @users.update_all(:extra_one_counter => 0.0)
          @users.update_all(:current_extra_one => 0.0)
          @users.update_all(:total_extra_one => 0.0)
          @users.update_all(:extra_two => 0.0)
          @users.update_all(:extra_two_counter => 0.0)
          @users.update_all(:current_extra_two => 0.0)
          @users.update_all(:total_extra_two => 0.0)
          @users.update_all(:extra_three => 0.0)
          @users.update_all(:extra_three_counter => 0.0)
          @users.update_all(:current_extra_three => 0.0)
          @users.update_all(:total_extra_three => 0.0)
          @users.update_all(:extra_four => 0.0)
          @users.update_all(:extra_four_counter => 0.0)
          @users.update_all(:current_extra_four => 0.0)
          @users.update_all(:total_extra_four => 0.0)
          @users.update_all(:extra_five => 0.0)
          @users.update_all(:extra_five_counter => 0.0)
          @users.update_all(:current_extra_five => 0.0)
          @users.update_all(:total_extra_five => 0.0)
          @users.update_all(:overall => 0.0)
          @users.update_all(:comment_one => nil)
          @users.update_all(:comment_two => nil)
          @users.update_all(:comment_three => nil)
          @users.update_all(:comment_four => nil)
          @users.update_all(:comment_five => nil)
          @users.update_all(:comment_six => nil)
          @users.update_all(:comment_seven => nil)
          @users.update_all(:comment_eight => nil)
          @users.update_all(:comment_nine => nil)
          @users.update_all(:comment_ten => nil)
          @users.update_all(:comment_eleven => nil)
          @users.update_all(:comment_twelve => nil)
          @users.update_all(:comment_thirteen => nil)
          @users.update_all(:comment_fourteen => nil)
          @users.update_all(:comment_fifteen => nil)
          @users.update_all(:comment_sixteen => nil)
          @users.update_all(:comment_seventeen => nil)
          @users.update_all(:comment_eighteen => nil)
          @users.update_all(:comment_nineteen => nil)
          @users.update_all(:comment_twenty => nil)
          @users.update_all(:comment_twenty_one => nil)
          @users.update_all(:comment_twenty_two => nil)
          @users.update_all(:comment_twenty_three => nil)
          @users.update_all(:comment_twenty_four => nil)
          @users.update_all(:comment_twenty_five => nil)
          
          if @user.role == 0
          @users.where(:role => 0).update_all(:question_one => nil)
          @users.where(:role => 0).update_all(:question_two => nil)
          @users.where(:role => 0).update_all(:question_three => nil)
          @users.where(:role => 0).update_all(:question_four => nil)
          @users.where(:role => 0).update_all(:question_five => nil)
          @users.where(:role => 0).update_all(:extra_one => nil)
          @users.where(:role => 0).update_all(:extra_two => nil)
          @users.where(:role => 0).update_all(:extra_three => nil)
          @users.where(:role => 0).update_all(:extra_four => nil)
          @users.where(:role => 0).update_all(:extra_five => nil)
          end
        end
      end
      
      if 
        redirect_to :back
      else
      render 'edit'
    end
  end
end
  
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role, 
                                   :username, :admin, :manager, :leader, :one_counter, :current_one,
                                   :two_counter, :current_two, :total_two, :three_counter, :current_three, :total_three,
                                   :four_counter, :current_four, :total_four,
                                   :five_counter, :current_five, :total_five,
                                   :extra_one, :extra_one_counter, :current_extra_one,
                                   :extra_two, :extra_two_counter, :current_extra_two,
                                   :extra_three, :extra_three_counter, :current_extra_three,
                                   :extra_four, :extra_four_counter, :current_extra_four,
                                   :extra_five, :extra_five_counter, :current_extra_five, :comment_one, :comment_two, :comment_three,
                                   :comment_four, :comment_five, :comment_six, :comment_seven, :comment_eight, :comment_nine, :comment_ten,
                                   :comment_eleven, :comment_twelve, :comment_thirteen, :comment_fourteen, :comment_fifteen, :comment_sixteen,
                                   :comment_seventeen, :comment_eighteen, :comment_nineteen, :comment_twenty, :comment_twenty_one, :comment_twenty_two, 
                                   :comment_twenty_three, :comment_twenty_four, :comment_twenty_five, :overall)
  end
  
  def user_question_params
      params.require(:user).permit()
  end
  
   # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
      store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
     # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(current_user) unless current_user.admin?
    end
    
    # Confirms a shift leader user.
    def second_tier_user
      redirect_to(current_user) unless current_user.leader?
    end
    
    # Confirms a manager user.
    def manager_user
        redirect_to(current_user) unless current_user.manager?
    end
  
end
