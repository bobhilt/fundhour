#!/usr/bin/env ruby
class Donation
    attr_accessor :amount, :attributes
    attr_reader :id, :donor_id, :campaign_id, :created_at

    def initialize(options) 
        @id = options[:id]
        @campaign_id = options[:campaign_id]
        @donor_id = options[:donor_id]
        @amount = options[:amount]
        @attributes = options[:attributes]
    end

    def save
        # implement datastore-level upsert when needed. Returns "saved" object.
        @created_at = @created_at || Time.now
        self
    end
end
