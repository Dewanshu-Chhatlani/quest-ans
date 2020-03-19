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
        redirect_to question_answers_path(@question)
    end
    def upvote
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.upvote_by current_user
        redirect_to question_answers_path(@question)
    end
    def downvote
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.downvote_by current_user
        redirect_to question_answers_path(@question)
    end
     
    private
        def answer_params
          params.require(:answer).permit(:answer, :answered_by)
        end
end
