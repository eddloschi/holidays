class Holiday
  include Mongoid::Document
  field :name, type: String
  field :schedule, type: Hash
  field :recurrent, type: Boolean

  validates_presence_of :name, :schedule, :recurrent

end
