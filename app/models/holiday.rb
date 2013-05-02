class Holiday
  include Mongoid::Document
  field :name, type: String
  field :schedule, type: Hash
  field :recurrent, type: Boolean

  validates_presence_of :name, :schedule, :recurrent

  after_find :create_next_occurrence

  def create_next_occurrence
    if self.recurrent?
      schedule = IceCube::Schedule.from_hash(self.schedule)
      self[:next_occurrence] = schedule.next_occurrence
    elsif
      day = schedule[:day_of_month]
      month = schedule[:month_of_year]
      today = Date.today
      if today.day > day and today.month >= month
        today >> 12
      end
      self[:next_occurrence] = Date.new(today.year, month, day)
    end
  end

end
