namespace :populator do
  task :clean_db do
    puts "Cleaning DB"
    #Coupon.delete_all
    #User.delete_all
  end

  task :reset_db do
    puts "Reesting DB..."
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    #Rake::Task['db:seed'].invoke
    Rake::Task['populator:reset_sample_data'].invoke
  end

  task :reset_sample_data => [:clean_db, :reset_db] do
    puts "Resetting Sample Data"

    puts "==============================="
    puts "Creating Users"
    user = CreateAdminService.new.call
    puts 'CREATED ADMIN USER: ' << user.email
    puts "==============================="
    puts "Creating Coupons"
    CreateCouponcodesService.new.call
    puts 'CREATED PROMOTIONAL CODES'

  end
end