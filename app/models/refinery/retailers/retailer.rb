module Refinery
  module Retailers
    class Retailer < Refinery::Core::BaseModel
      self.table_name = 'refinery_retailers'

      before_validation :smart_add_url_protocol

      geocoded_by :geocode_address_string

      after_validation :geocode

      validates :address, :presence => true, :uniqueness => true

      acts_as_indexed :fields => [:title, :contact, :address, :country_code, :state_code, :city]

      default_scope { order('lower(title) ASC') }

      scope :published, -> { where :draft => false }

      protected

      def geocode_address_string
        address_attributes = [:address, :county, :city].map{ |field| self[field.to_s] }
        address_attributes << Carmen::Country.coded(self.country_code).name
        address_attributes.join(', ')
      end

      def smart_add_url_protocol
        unless self.website.empty?
          unless (self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//])
            self.website = "http://#{self.website}"
          end
        end
      end
    end
  end
end
