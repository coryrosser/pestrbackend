class GroupmembersController < ApplicationController
    def index
        @groupmembers = Groupmember.all
        render :json => @groupmembers.as_json(
            :include => [
                :user, :group
            ]
        )
    end
    def create
        @groupmember = Groupmember.create(groupmember_params)
        render :json => @groupmember.as_json(
            :include => [
                :user, :group
            ]
        )
    end

    private 

    def groupmember_params
        params.require(:groupmember).permit(
            :user_id, :group_id
        )
    end
end
