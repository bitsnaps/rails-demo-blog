module Sluggable

  extend ActiveSupport::Concern

    included do

      before_validation :set_default_slug, only: [:create, :update], if: '!slug.nil?'
      validates :slug, format: { with: /\A[a-z0-9\-]+\z/}, uniqueness: true

      private

      # def default_slug2
        # cancel saving
        # if self.name.nil? || self.name.empty?
        #   return false
        # end
      # end

      def set_default_slug
        if (!self.name.nil? && !self.name.empty?) && (self.slug.nil? || self.slug.empty?)
          self.slug = name.parameterize # create a slug from the name
        end
      end
  end

end
