class BoatingTest
  attr_reader :student, :boating_test_name, :instructor
  attr_accessor :boating_test_status

  @@all = []
  def initialize(student, boating_test_name, boating_test_status, instructor)
    @student = student
    @boating_test_name = boating_test_name
    @boating_test_status = boating_test_status
    @instructor = instructor
    self.class.all << self
  end

  def self.all
    @@all
  end

end
