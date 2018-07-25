namespace :generate do
  desc "Generate Results for all levels"
  task results: :environment do
    Result::Level1.where(level: 1, stage: 1)
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Result::Level1.where(level: 1, stage: 2)
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Result::Level2.where(level: 2, stage: 1)
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Result::Level2.where(level: 2, stage: 2)
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end
  end
end