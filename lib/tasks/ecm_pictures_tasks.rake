namespace :ecm do
  namespace :pictures do
    namespace :db do
      desc "Purges and creates example data"
      task :populate!, [] => [:environment] do |t, args|
        Rake::Task["ecm:pictures:db:clear!"].execute
        Rake::Task["ecm:pictures:db:populate"].execute
      end

      desc "Clears all data!"
      task :clear!, [] => [:environment] do |t, args|
        Rake::Task["ecm:pictures:db:clear_galleries!"].execute
        Rake::Task["ecm:pictures:db:clear_pictures!"].execute
      end

      desc "Clears all gallery data!"
      task :clear_galleries!, [] => [:environment] do |t, args|
        Ecm::Pictures::PictureGallery.delete_all
      end

      desc "Clears all picture data!"
      task :clear_pictures!, [] => [:environment] do |t, args|
        Ecm::Pictures::Picture.delete_all
      end

      desc "Creates example data"
      task :populate, [] => [:environment] do |t, args|
        Rake::Task["ecm:pictures:db:populate_galleries"].execute
        Rake::Task["ecm:pictures:db:populate_pictures"].execute
      end

      desc "Creates example data for galleries"
      task :populate_galleries, [] => [:environment] do |t, args|
        5.times do |i|
          Ecm::Pictures::PictureGallery.create! do |pg|
            pg.name = "Picture Gallery #{i}"
          end
        end
      end

      desc "Creates example data for pictures"
      task :populate_pictures, [] => [:environment] do |t, args|
        require "ffaker"
        require "forgery"

        picture_galleries = Ecm::Pictures::PictureGallery.all
        50.times do
          Ecm::Pictures::Picture.create! do |p|
            p.picture_gallery = picture_galleries.choice
            p.image = File.open(File.join(Ecm::Pictures::Engine.root, 'spec/files', 'ecm/pictures/pictures', 'example.jpg'))
            p.name = Faker::Product.brand if (rand(2) == 1)
            p.description = Faker::Lorem.paragraph(rand(10))
          end
        end
      end
    end
  end
end


