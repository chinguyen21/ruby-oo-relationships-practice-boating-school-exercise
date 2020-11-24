class Instructor
  attr_reader :name

   @@all = []
  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def passed_students
    pass_student = []
    BoatingTest.all.each do |bt| 
      if bt.instructor == self && bt.boating_test_status == "passed"
        pass_student << bt.student
      end
    end
    pass_student
  end

  def pass_student(student_object, test_name)
    BoatingTest.all.each do |bt|
      if bt.student == student_object && bt.boating_test_name == test_name
        bt.boating_test_status = "passed"
      end
    end
  end

  def fail_student(student_object, test_name)
    count = 0
    BoatingTest.all.each do |bt|
      if bt.student == student_object && bt.boating_test_name == test_name
        bt.boating_test_status = "failed"
        count += 1
      end
    end
    if count == 0
      BoatingTest.new(student_object, test_name, "failed", self)
    end
  end

  def all_students
    BoatingTest.all.select {|bt| bt.instructor == self}
  end
end
