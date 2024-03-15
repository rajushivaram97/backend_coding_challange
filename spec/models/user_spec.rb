require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.with_two_or_more_apps' do
    it 'returns users with 2 or more app purchases' do
      # Setup
      user_with_two_apps = User.create(email: 'user_with_two_apps@example.com')
      user_with_one_app = User.create(email: 'user_with_one_app@example.com')
      app1 = App.create(name: 'App 1', kind: 0, price_tier: 1)
      app2 = App.create(name: 'App 2', kind: 1, price_tier: 2)
      app3 = App.create(name: 'App 3', kind: 2, price_tier: 3)

      Purchase.create(user: user_with_two_apps, app: app1)
      Purchase.create(user: user_with_two_apps, app: app2)
      Purchase.create(user: user_with_one_app, app: app3)

      # Exercise
      result = User.with_two_or_more_apps

      # Verify
      expect(result).to include(user_with_two_apps)
      expect(result).not_to include(user_with_one_app)

      # Cleanup is handled by database_cleaner or Rails transactional tests
    end
  end
end
