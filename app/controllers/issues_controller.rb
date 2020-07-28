class IssuesController < ApplicationController
        before_action :find_issue, only: [:show, :update, :destroy]
        def index 
            @issues = Issue.all
            render :json => @issues.as_json(
                only: [:id, :title, :description, :urgency, :status,
                    :group_id, :creator_id, :assigned_user_id],
            include: [
                creator:{
                    except: [:password]
                },
                assigned_user:{
                    except: [:password]
                },
                updates:{
                    except: [:updated_at]
                }
            ])
        end 
    
        def create 
            @issue = Issue.create(issue_params)
    
            render :json => @note.as_json(
                only: [:id, :title, :description, :urgency, :status,
                    :group_id, :creator_id, :assigned_user_id],
                :include => [
                    user:{
                        except: [:password]
                    }
                ]
                ), status: :ok
        end
    
        private 
    
        def issue_params
            params.require(:issue).permit(
                :title, :description, :urgency, :status,
                :group_id, :creator_id, :assigned_user_id
            )
        end
end
