class GroupsController < ApplicationController
    before_action :find_group, only: [:show, :update, :destroy]
    def index 
        @groups = Group.all
        render :json => @groups.as_json(
            only: [:id, :name, :user_id, :group_code],
        include: [
            users:{
                except: [:password]
            },
            issues:{
                except: [:password]
            },
            updates:{
                except: [:updated_at]
            }
        ])
    end 

    def show
        if @group 
            render :json => @group.as_json(only: [:name, :user_id, :group_code],
            :include => [
                groupmembers:{
                    except: [:password]
                },
                issues:{
                    except: [:updated_at]
                },
                updates:{
                    except: [:updated_at]
                }
            ]
            )
        end
    end

    def create 
        @group = Group.create(group_params)

        render :json => @note.as_json(
            only: [:id, :name, :user_id, :group_code],
            :include => [
                user:{
                    except: [:password]
                }
            ]
            ), status: :ok
    end

    private 

    def group_params
        params.require(:group).permit(
            :name, :user_id, :group_code
        )
    end
end
