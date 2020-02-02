User.find_or_create_by!(email: 'admin@example.com') do |user|
  name: 'admin',
  email: 'admin@example.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password'
end
