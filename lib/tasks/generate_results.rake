namespace :generate do
  desc "Generate Results for all levels"
  task results: :environment do
    Results::Result.where(stage: 1, type: 'Results::Level1')
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Results::Result.where(stage: 2, type: 'Results::Level1')
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Results::Result.where(stage: 1, type: 'Results::Level2')
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Results::Result.where(stage: 2, type: 'Results::Level2')
          .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Results::Result.where(stage: 1, type: 'Results::Level3')
      .first_or_create! do |result|
    result.update(result: result.calculate)
    end

    Results::Result.where(stage: 2, type: 'Results::Level3')
      .first_or_create! do |result|
    result.update(result: result.calculate)
    end
  end
end