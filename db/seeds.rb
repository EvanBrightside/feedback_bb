User.create!(email: 'admin@admin.io', password: '123456', admin: true)
User.create!(email: 'hello@ivanzabrodin.com', password: '1q2w3e', admin: true)
User.create!(email: 'hello@ivanzabrodin.io', password: '654321', admin: true)

Feedback.create!(body: 'hello there', email: 'here@mail.com')
Feedback.create!(body: 'hello there 2', email: 'here2@mail.com')
Feedback.create!(body: 'hello there 22', email: 'here22@mail.com')

Feedback.create!(body: 'just text and text')
Feedback.create!(body: 'just text and journal')
Feedback.create!(body: 'just text and nespapper')
Feedback.create!(body: 'just text and review')
