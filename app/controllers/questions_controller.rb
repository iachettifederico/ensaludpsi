class QuestionsController < ApplicationController

	def create
		@question = Question.new(params[:question])
		QuestionMailer.ask_question(@question).deliver
		redirect_to contacto_path, :notice => "Consulta realizada."
	end

end
