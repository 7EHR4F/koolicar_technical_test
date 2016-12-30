class Rental < ApplicationRecord
  has_many :positions
  has_attached_file :csv
  validates :name, presence: true
  validates :csv, presence: true
  validates_attachment_content_type :csv, content_type: ['text/plain', 'text/csv', 'application/vnd.ms-excel']
  after_create_commit :create_event

  def success(process_csv)
    Event.create message: "Your csv file #{self.csv.path} has been processed for the Rental #{self.id}, total distance: #{self.kilometers}"
  end

  def failure(process_csv)
    Event.create message: "Your csv file #{self.csv.path} couldn't be processed for the Rental #{self.id}"
  end

  def process_locations
    positions = self.positions
	total_distance = 0
	positions.each_with_index do |p, ctr|
	 next_element = positions[ctr + 1]
	 total_distance = total_distance +  p.distance_to(next_element) if next_element
	end
	self.kilometers = total_distance
	self.save
  end

  def process_csv
	options = {:col_sep => ";", :row_sep => "\cM\n"}
    n = SmarterCSV.process(File.open(self.csv.path), options) do |array|
	  Position.create(rental_id: self.id, timestamp: array.first.values.first, latitude: array.first.values.second, longitude: array.first.values.third)
    end
	self.process_locations
  end
  handle_asynchronously :process_csv, :priority => 0
  
  private

  def create_event
    Event.create message: "Your csv file is being processed"
  end

end
