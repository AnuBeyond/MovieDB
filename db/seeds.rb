#create super admin account
User.first_or_create(email: 'admin@example.com', password: "000000", admin: true)
