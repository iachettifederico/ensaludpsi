class QuestionMailer < ActionMailer::Base
  default :to => "info@ensaludpsi.com.ar", :from => "info@ensaludpsi.com.ar"
  
  def ask_question(question)
    @question = question
    mail(:subject => "[ensaludpsi.com.ar] #{question.subject}", :relply_to => question.from)
  end
end
