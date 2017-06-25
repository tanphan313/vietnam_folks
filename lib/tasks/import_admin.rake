namespace :master_data do
  desc "Import admin"
  task import_admin: :environment do
    User.destroy_all
    ActiveRecord::Base.transaction do
      ["admin1@hvt.edu.vn", "admin2@hvt.edu.vn", "admin3@hvt.edu.vn"].each do |email|
        User.create(email: email, password: "12345678", password_confirmation: "12345678", admin: true)
      end
      User.create(email: "tanphan@hvt.com", password: "12345678", password_confirmation: "12345678", admin: true)
    end
    p "Finish import admin"
  end
end
