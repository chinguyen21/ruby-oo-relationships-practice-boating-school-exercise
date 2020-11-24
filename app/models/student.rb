class Student
  attr_reader :first_name
  @@all = []
  def initialize(first_name)
    @first_name = first_name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(boating_test_name, boating_test_status, instructor)
    BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
  end

  def all_instructors
    instructors = []
    BoatingTest.all.each do |bt| 
      instructors << bt.instructor if bt.student == self
    end
    instructors
  end

  def self.find_student(name)
    students = []
    BoatingTest.all.each do |bt|
       if bt.student.first_name == name
        students << bt.student 
       end
    end
    students
  end

  def boating_tests 
    BoatingTest.all.select {|bt| bt.student == self }
  end

  def grade_percentage
    passed_test = self.boating_tests.count {|bt| bt.boating_test_status == "passed"}
    passed_test / self.boating_tests.length.to_f * 100
  end


end
