require 'pry'

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_person)
    grade > other_person.grade
  end

  protected

  attr_reader :grade
end

binding.pry