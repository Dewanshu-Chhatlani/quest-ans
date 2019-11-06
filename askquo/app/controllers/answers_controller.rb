class AnswersController < ApplicationController
    def index
        @question = Question.find(params[:question_id])
        @answers = @question.answers.all
    end
    def new
        @question = Question.find(params[:question_id])
        @answer ||= Answer.new
    end
    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.create(answer_params)
        redirect_to question_path(@question)
    end
     
    private
        def answer_params
          params.require(:answer).permit(:answer, :answered_by)
        end
end
