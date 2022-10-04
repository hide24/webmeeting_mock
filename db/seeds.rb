# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  {
    service_name: 'WebEx',
    enabled: true,
    extras: nil,
  },
  {
    service_name: 'Microsoft Teams',
    enabled: true,
    extras: nil,
  },
  {
    service_name: 'Zoom',
    enabled: true,
    extras: nil,
  },
].each do |s|
  ExternalService.find_or_initialize_by(service_name: s[:service_name]) do |service|
    service.enabled = s[:enabled]
    service.extras = s[:extras]
    service.save
  end
end

[
  {
    display_name: 'Yoshimoto',
    mail: 'yoshimoto@example.com',
    guest: false,
    another_mail: false, # trueにすると外部サービスとの連携時にメールアドレス不一致のエラーにするよ
  },
  {
    display_name: 'Nishikawa',
    mail: 'Nishikawa@example.com',
    guest: false,
    another_mail: false, # trueにすると外部サービスとの連携時にメールアドレス不一致のエラーにするよ
  },
  {
    display_name: 'Komiyama',
    mail: 'komiyama@example.com',
    guest: false,
    another_mail: false, # trueにすると外部サービスとの連携時にメールアドレス不一致のエラーにするよ
  },
  {
    display_name: 'Shimoyama',
    mail: 'shimoyama@example.com',
    guest: false,
    another_mail: false, # trueにすると外部サービスとの連携時にメールアドレス不一致のエラーにするよ
  },
  {
    display_name: 'Butoh',
    mail: 'butoh@example.com',
    guest: false,
    another_mail: true, # trueにすると外部サービスとの連携時にメールアドレス不一致のエラーにするよ
  },
].each do |u|
  User.find_or_initialize_by(display_name: u[:display_name]) do |user|
    user.mail = u[:mail]
    user.guest = u[:guest]
    user.another_mail = u[:another_mail]
    user.save
  end
end
