namespace :user do
  desc "Import users from giving CSV file"
  task import: :environment do
    CSV.foreach('users.csv', headers: true) do |row|
      puts row.to_hash
      User.create! row.to_hash
    end
  end

  desc "Export all Users from database to CSV file"
  task export: :environment do
    File.open('users.csv', 'wb') do |csv|
      csv << User.column_names
      User.all.each do |user|
        csv << user.attributes.values_at(*User.column_names)
      end
    end
  end

end
