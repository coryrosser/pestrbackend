Update.destroy_all
Issue.destroy_all
Groupmember.destroy_all
Group.destroy_all
User.destroy_all 

u1 = User.create(first_name: 'Cory', last_name: 'Rosser', 
    email: 'cory@mail.com', password: 'test')
u2 = User.create(first_name: 'Harry', last_name: 'Corbett', 
    email: 'harry@mail.com', password: 'test')
u3 = User.create(first_name: 'Dan', last_name: 'Huckaby', 
    email: 'dan@mail.com', password: 'test')
u4 = User.create(first_name: 'Dom', last_name: 'Wynn', 
    email: 'dom@mail.com', password: 'test')
u5 = User.create(first_name: 'Darius', last_name: 'Harris', 
    email: 'darius@mail.com', password: 'test')

g1 = Group.create(name: 'Group 1', user_id: u1.id, group_code: 'test')

gm1 = Groupmember.create(group_id: g1.id, user_id: u1.id)
gm2 = Groupmember.create(group_id: g1.id, user_id: u2.id)
gm3 = Groupmember.create(group_id: g1.id, user_id: u3.id)
gm4 = Groupmember.create(group_id: g1.id, user_id: u4.id)
gm5 = Groupmember.create(group_id: g1.id, user_id: u5.id)

i1 = Issue.create(title: 'First Issue', description: 'First Description',
    urgency: 1, status: 1, group_id: g1.id, 
    creator_id: u1.id, assigned_user_id: u4.id)

update1 = Update.create(issue_id: i1.id, user_id: u4.id, 
    content: 'This is an update')

