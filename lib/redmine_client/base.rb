module RedmineClient
  DEFAULT_RESOURCES = %w(project issue news user attachment role group query tracker)
  class Base < ActiveResource::Base
    # TODO: JSON work is wrong
    self.format = :xml

    class << self

      # configure site, user, password, token, resources
      # define resources if you don't needed include all
      def configure(&block)
        instance_eval &block
      end

      # Assign resources
      def resources=(options=nil)
        options ||= RedmineClient::DEFAULT_RESOURCES
        options.each do |c|
          RedmineClient.const_set(c.capitalize, Class.new(RedmineClient::Base)) if RedmineClient::DEFAULT_RESOURCES.include? c.downcase
        end
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

end

