class Job < ActiveRecord::Base

  belongs_to :part


  require 'date'


  def leadtime
    @rate = Part.find(part_id)[:rate]
    @std_people = Part.find(part_id)[:std_people]
    @shift_length_default = 7.5
    @std_lead = ((quantity/@rate)/@std_people)/@shift_length_default
  end


  def late_check
    self.leadtime
    @time_remaining = (date_due - Date.today).to_i
    if @time_remaining < @std_lead
    then
      @late=true
    else
      @late=false
    end
  end


  def schedule(staff_available=10)
    self.late_check
    @message = nil

    if @late
      if @time_remaining > 0
        @extra_people_count = (quantity/@rate)/(@time_remaining/@shift_length_default).round
        @message = "You need to put #{@extra_people_count.round} people on this job to be on time"
      else
        @newlead = ((quantity/@rate)/staff_available)/@shift_length_default
        @start_date = (Date.today+1) + @newlead
        @message = "Your new due date will be #{@start_date} if you use #{staff_available} people"
      end
    else
      @end_date = date_due - 1
      @start_date = @end_date - @std_lead -1
      @message = "Schedule - Start #{@start_date} and finish #{@end_date}"
    end

  end

end