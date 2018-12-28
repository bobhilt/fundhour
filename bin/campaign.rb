#!/usr/bin/env ruby
class Campaign

    attr_accessor :name, :title, :group, :goal_amount, :attributes
    attr_reader :id, :created_at

    def initialize(options) 
        @id = options[:id] #nil if unknown
        @title = options[:title]
        @group = options[:group]
        @goal_amount = options[:goal_amount]
        @attributes = options[:attributes]
    end

    def save
        # implement datastore-level upsert when needed. Returns "saved" object.
        @created_at = Time.now
        puts @created_at
        self
    end

    def get_donations
        'array of donation objects'
    end
end
