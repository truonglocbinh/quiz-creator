class Result < ActiveRecord::Base
  belongs_to :exam_user
  belongs_to :question
  belongs_to :answer
  scope :correct_answer, -> {joins(:answer, :question).where answers: {correct: true}, 
  	questions: {question_type: 0}} 
  scope :multiple_question, -> {joins(:question).where questions: {question_type: 1}}
end
