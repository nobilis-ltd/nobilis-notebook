desc "Update slugs for existing users"

task :update_user_slugs => :environment do
  User.all.map(&:create_slug)
end