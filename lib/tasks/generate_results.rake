namespace :generate do
  desc "Generate Results for all levels"
  task results: :environment do
    Result.where(level: 1, stage: 1)
          .first_or_create
          .update(result: Processor::Calculate.new.level1(1))

    Result.where(level: 1, stage: 2)
          .first_or_create
          .update(result: Processor::Calculate.new.level1)
  end
end