#!/usr/bin/env ruby
class Donor

    attr_accessor :name, :contact_info, :attributes
    attr_reader :id, :created_at

    def initialize(options) 
        @id = options[:id] #nil if unknown
        @name = options[:name]
        @contact_info = options[:contact_info]
        @attributes = options[:attributes]
    end

    def save
        # implement datastore-level upsert when needed. Returns "saved" object.
        self
    end

    def get_donations
        'array of donation objects'
    end
end
