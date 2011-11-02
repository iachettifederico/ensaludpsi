class QuestionsController < ApplicationController

	def create
		@question = Question.new(params[:question])
		if @question.valid?
      QuestionMailer.ask_question(@question).deliver
			redirect_to contacto_path, :notice => "La consulta fue realizada con éxitos. Muchas gracias por contactarte con nosotros."
    else
      @title = 'Contacto'
      render 'pages/contacto'
    end
		
		
	end

end
