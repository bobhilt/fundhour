#!/usr/bin/env ruby
class Campaign

    attr_accessor :name, :contact_info, :attributes
    attr_reader :id, :created_at

    def initialize(options) 
        @id = options[:id] #nil if unknown
        @title = options[:name]
    end

    def save
        # implement datastore-level upsert when needed. Returns "saved" object.
        self
    end

    def get_donations
        'array of donation objects'
    end
end
