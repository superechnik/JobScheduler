class Job < ActiveRecord::Base

belongs_to :part


require 'date'


	def initialize(job_id, priority, quantity, date_due, part_num, part_id)
		@job_id = job_id
		@priority = priority
		@quantity = quantity
		@date_due = Date.parse(date_due)
		@part_num = part_num
		@part_id = part_id
		@rate = self.part[:rate]
		@std_people = self.part[:std_people]

		
		
		self.leadtime
		self.late_check
		self.schedule
		self.expedite_staff
	end


        

      
	def leadtime
	    @shift_length_default = 7.5
            @std_lead = ((@quantity/@rate)/@std_people)/@shift_length_default       
	end  
	
    
	def late_check
    
		@time_remaining = (@date_due - Date.today).to_i
			if @time_remaining < @std_lead 
			then @late=true
			else @late=false
		end
	end
	
	
    def schedule
        
       if @late == false
            @end_date = @date_due - 1
		    @start_date = @end_date - @std_lead 
	    end
   
  end
  
  
  	def expedite_staff(staff_available=10)
	    	
	    	if @time_remaining > 0
	    	    @extra_people_count = (@quantity/@rate)/(@time_remaining/@shift_length_default).round
	    	    puts "You need to put #{@extra_people_count.round} people on this job to be on time"
            else 
                @newlead = ((@quantity/@rate)/staff_available)/@shift_length_default
                @start_date = (Date.today+1) + @newlead
                puts "Your new due date will be #{@start_date} if you use #{staff_available} people"
            end
       end
  
end


