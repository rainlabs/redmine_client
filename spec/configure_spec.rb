#require 'pry'
# FIXME: dynamic classes not test it correct
require 'spec_helper'

describe RedmineClient::Base do

  describe '.configure' do
    it 'with nil resources' do
      RedmineClient::Base.configure do |config|
        config.site = REDMINE_SITE
        config.resources = nil
      end
      RedmineClient::DEFAULT_RESOURCES.each do |res|
        lambda {"#{RedmineClient}::#{res.capitalize}".constantize}.should_not raise_error
      end
    end

    it 'with some resources' do
      resources = %w(project issue)
      RedmineClient::Base.configure do |config|
        config.site = 'http://redmine.org'
        config.resources = resources
      end
      RedmineClient::DEFAULT_RESOURCES.each do |res|
        if resources.include? res.downcase
          lambda {"#{RedmineClient}::#{res.capitalize}".constantize}.should_not raise_error
        else
          lambda {"#{RedmineClient}::#{res.capitalize}".constantize}.should raise_error
        end
      end
    end

    it 'without resources' do
      RedmineClient::Base.configure do |config|
        config.site = 'http://redmine.org'
      end
      RedmineClient::DEFAULT_RESOURCES.each do |res|
        lambda {"#{RedmineClient}::#{res.capitalize}".constantize}.should_not raise_error
      end
    end

  end

end