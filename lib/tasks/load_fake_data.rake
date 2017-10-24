namespace :load_fake_data do
  task books: :environment do
    1000.times do
      Book.new({ean: Faker::Number.unique.number(13).to_s,
                isbn: Faker::Number.unique.number(10).to_s,
                author: Faker::Book.author,
                title: Faker::Book.title
               }).save!
    end
  end

  task amazon_data: :environment do
    Book.all.each do |book|
      AmazonDatum.new({book: book, lowest_fba: Faker::Commerce.price, lowest_good_price: Faker::Commerce.price, sales_rank: Faker::Number.number(8)}).save!
    end
  end

  task guide_data: :environment do
    Book.all.each do |book|
      GuideDatum.new({book: book, list_price: Faker::Commerce.price}).save!
    end
  end

  task indaba_data: :environment do
    Book.all.each do |book|
      IndabaDatum.new({book: book,
                       bbap: Faker::Commerce.price,
                       direct: Faker::Commerce.price,
                       tqs: Faker::Number.number(3),
                       weekly_sqad: Faker::Number.number(3),
                       weekly_sqmd: Faker::Number.number(3),
                       past_day_sales_history_quantity: Faker::Number.number(3),
                       past_week_sales_history_quantity: Faker::Number.number(3),
                       past_month_sales_history_quantity: Faker::Number.number(3),
                       past_year_sales_history_quantity: Faker::Number.number(3),
                       daily_rqf: Faker::Number.number(3),
                       weekly_rqf: Faker::Number.number(3),
                      }).save!
    end
  end

  task indaba_instances: :environment do
    Book.all.each do |book|
      5.times do
        IndabaInstance.new({book: book,
                            name: Faker::Company.name,
                            quantity_online: Faker::Number.number(3),
                            lowest_price: Faker::Commerce.price,
                           }).save!
      end
    end
  end

  task orders: :environment do
    Book.all.each do |book|
      100.times do
        Order.new({book: book,
                   buyer_email: Faker::Internet.email
                  }).save!
      end
    end
  end

  task all: [:books, :amazon_data, :guide_data, :indaba_data, :indaba_instances, :orders]
end
