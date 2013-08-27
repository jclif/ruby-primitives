class Student
  def initialize(first,last)
    @first_name = first
    @last_name = last
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def courses
    @courses
  end

  def enroll(course)
    @courses.each do |course_from_list|
      if course.conflicts_with?(course_from_list)
        raise "#{self.name} has a conflict with #{course.course_name}"
      end
    end
    @courses << course unless @courses.include?(course)
    course.add_student(self)
  end

  def course_load
    course_hash = {}
    @courses.each do |course|
      if course_hash.key?(course.department)
        course_hash[course.department] += course.number_of_credits
      else
        course_hash[course.department] = course.number_of_credits
      end
    end
  end
end

class Course
  attr_accessor :course_name,:department,:number_of_credits,:days,:time
  def initialize(course_name,department,number_of_credits,days,time)
    @course_name = course_name
    @department = department
    @number_of_credits = number_of_credits
    @students = []
    @days = days
    @time = time
  end

  def students
    @students
  end

  def add_student(student)
    @students << student unless students.include?(student)
  end

  def conflicts_with?(other_course)
    @days.each do |day|
      if other_course.days.include?(day) and @time == other_course.time
        return true
      end
      return false
    end
  end
end

jc = Student.new('Jared','Clifton')
jp = Student.new('Jonathan','Potter')

aa = Course.new('App Academy', 'Computer Science', '500',[:mon,:tue,:wed,:thu,:fri],1)
bb = Course.new('Bad Boring', 'Business', '1',[:mon],1)

jc.enroll(aa)
jp.enroll(aa)
jc.enroll(bb)

puts jc.courses
puts aa.students
puts jp.course_load