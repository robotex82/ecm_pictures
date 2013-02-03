module Ecm
  module Pictures
    class Routing
      # Creates the routes for pictures and galleries. You can pass options to
      # specify the actions for both pictures and/or galleries.
      #
      #   Ecm::Pictures::Routing.routes(self, { :picture_gallery_actions => [ :show ]})
      #
      # This will only create the show action for picture galleries, but omit the index action.
      def self.routes(router, options = {})
        options.reverse_merge!(
          { :picture_gallery_actions => [:index, :show], 
            :picture_actions => [:index, :show] 
          }
        )
        
        router.resources :ecm_pictures_picture_galleries, :only => options[:picture_gallery_actions], :controller => 'ecm/pictures/picture_galleries'
        router.resources :ecm_pictures_pictures,:only => options[:picture_actions], :controller => 'ecm/pictures/pictures'      
      end  
    end
  end
end    
