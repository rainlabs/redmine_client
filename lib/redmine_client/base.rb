module RedmineClient
  class Base < ActiveResource::Base
<<<<<<< HEAD
    # TODO: JSON work is wrong
    self.format = :xml

    class << self

      def configure(&block)
        instance_eval &block
      end

      # Get your API key at "My account" page
      def token= val
        if val
          (descendants + [self]).each do |resource|
            resource.headers['X-Redmine-API-Key'] = val
          end
        end
      end
    end
  end

  # Define class dynamically
  # TODO: need configuration file
  %w(project issue news user attachment role group query tracker).each do |c|
    const_set c.capitalize, Class.new(Base)
  end

end

