module Api
  module V1
    class AnswersController < Api::V1::ApiController
      before_action :doorkeeper_authorize!, only: :create
      before_action :authorize_owner, only: %i[update destroy]

      def index
        info = {
          page: params[:page] || 1,
          per_page: params[:per_page] || 5
        }
        answers = question.answers.paginate(page: info[:page], per_page: info[:per_page])
        render json: answers, status: :ok, params: info, meta: pagination_dict(answers)
      end

      def create
        @answer = Answer.new(answer_params)
        if @answer.save
          render json: @answer, status: :ok
        else
          render json: {}, status: :unprocessable_entity, error: error_message
        end
      end

      def update
        if answer.update(answer_params)
          render json: answer, status: :ok
        else
          render json: {}, status: :unprocessable_entity, error: error_message
        end
      end

      def destroy
        answer.destroy
        render json: {}, status: :no_content
      end

      private

      def answer_params
        params.require(:data).require(:attributes).permit(:body).merge(
          user_id: cureent_user.id,
          question_id: question.id
        )
      end

      def question
        QuestionFinder.run(params[:slug])
      end

      def answer
        Answer.find_by_id(params[:id])
      end

      def authorize_owner
        current_user.answers.include?(answer)
      end

      def error_message
        question.errors.full_messages.to_sentence
      end
    end
  end
end