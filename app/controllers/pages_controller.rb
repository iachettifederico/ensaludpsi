class PagesController < ApplicationController
  def home
    @title = 'Página de inicio'
  end

  def mat_y_pat
    @title = 'Maternidad y paternidad'
  end

  def consultorio
    @title = 'Consultorio'
  end

  def contacto
    @title = 'Contacto'
    @question = Question.new
  end

end
