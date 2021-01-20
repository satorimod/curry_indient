FactoryBot.define do
  factory :gourmet do
    name            { 'ネーム' }
    genre_id        { 3 }
    area_id         { 3 }
    menu            { 'チーズナンセット' }
    feature         { 'カスリメティの香りが特徴的' }
    content         { 'ここのチーズナンはチーズたっぷりでリッチな味わい。オススメ！' }

    association :user

    after(:build) do |gourmet|
      gourmet.image.attach(io: File.open('public/images/testimage.png'), filename: 'output-image1.png')
    end
  end
end
