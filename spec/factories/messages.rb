FactoryGirl.define do
  factory :message do
    content Faker::Lorem.sentence
    image File.open("#{Rails.root}/public/images/kis0107-049.jpg")
    user
    group
  end
end

# file.openでpublic以下は、imageフォルダを作成し、適当なjpgファイルを配置し記述
