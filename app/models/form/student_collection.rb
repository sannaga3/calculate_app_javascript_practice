class Form::StudentCollection
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  FORM_COUNT = 1
  attr_accessor :students

  def initialize(attributes = {})
    super attributes

    unless self.students.present?
      self.students = FORM_COUNT.times.map { Student.new() }
    else
      self.students.count.times.map { Student.new() }
    end
  end

  def students_attributes=(attributes)
    self.students = attributes.map { |_, v| Student.new(v) }
  end

  def save
    Student.transaction do
      self.students.map do |s|
        s.save
      end
      return true
    rescue => e
      return false
    end
  end
end
