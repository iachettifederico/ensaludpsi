class QuestionMailer < ActionMailer::Base
  default :to => "info@ensaludpsi.com.ar"
  
  def ask_question(question)
    @question = question
    mail(:from => "#{question.name} <#{question.from}>", :subject => "[ensaludpsi.com.ar] #{question.subject}")
  end
end
