module RedmineClient
  class Base < ActiveResource::Base
    # TODO: JSON work is wrong
    self.format = :xml
  
    def self.configure(&block)
      instance_eval &block
    end

  end
end

