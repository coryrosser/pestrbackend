class UpdatesController < ApplicationController
    def index 
        @updates = Update.all
        render :json => @updates.as_json(
            only: [:id, :issue_id, :user_id, :content],
        include: [
            user:{
                except: [:password]
            }
        ])
    end 

    def create 
        @update = Update.create(update_params)

        render :json => @note.as_json(
            only: [:id, :issue_id, :user_id, :content],
            :include => [
                user:{
                    except: [:password]
                }
            ]
            ), status: :ok
    end

    private 

    def update_params
        params.require(:update).permit(:issue_id, :user_id, :content)
    end
end
