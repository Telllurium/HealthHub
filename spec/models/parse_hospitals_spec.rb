require 'rails_helper'
require 'rake'

RSpec.describe 'parse:hospitals' do
  describe 'rake task' do
    before :all do
      Rake.application.rake_require('tasks/parse_hospitals')
      Rake::Task.define_task(:environment)
    end

    it 'successfully parses hospitals data' do
      expect { Rake::Task['parse:hospitals'].invoke }.to_not raise_error
    end

    it 'saves hospitals to the database' do
      expect { Rake::Task['parse:hospitals'].invoke }.to change { Hospital.count }.by_at_least(1)
    end

    it 'handles errors gracefully' do
      allow_any_instance_of(Object).to receive(:puts)
      expect { Rake::Task['parse:hospitals'].invoke }.to_not raise_error
    end
  end
end