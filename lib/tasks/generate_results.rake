namespace :generate do
  desc "Generate Results for all levels"
  task results: :environment do
    Result.where(level: 1, stage: 1)
          .first_or_create
          .update(result: Processor::Level.new(1, 1).result)

    Result.where(level: 1, stage: 2)
          .first_or_create
          .update(result: Processor::Level.new(1, 2).result)

    Result.where(level: 2, stage: 1)
          .first_or_create
          .update(result: Processor::Level.new(2, 1).result)

    Result.where(level: 2, stage: 2)
          .first_or_create
          .update(result: Processor::Level.new(2, 2).result)
  end
end