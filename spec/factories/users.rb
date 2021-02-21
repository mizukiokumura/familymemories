FactoryBot.define do
  factory :user do
    nickname { Faker::Name.middle_name}
    email { Faker::Internet.email}
    password {Faker::Internet.password(min_length:6)}
    password_confirmation { password}
    jp_first_name { Gimei.first.kanji}
    jp_last_name {Gimei.last.kanji}
    jp_kana_first_name { Gimei.first.katakana}
    jp_kana_last_name {Gimei.last.katakana}
    birthday { Faker::Date.birthday(min_age:10, max_age:70)}
    profile { Faker::Lorem.paragraph}
  end
end