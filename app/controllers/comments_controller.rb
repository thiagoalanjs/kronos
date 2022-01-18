class CommentsController < ApplicationController
    before_action :set_task

    def create 
        @task.comments.create(comment_params.to_h.merge!({ user_id: current_user.id}))
        redirect_to task_path(@task), notice: "Comentário criado com sucesso."
    end

    def show
    end

    def destroy
        comment = @task.comments.find(params[:id])
        authorize comment

        comment.destroy
        redirect_to task_path(@task), notice: "Comentário deletado com sucesso."
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_task
        @task = Task.find(params[:task_id])
    end
end