require 'rails_helper'

RSpec.describe NotificationsChannel, type: :channel do
  let(:user) { create(:user) }

  it 'successfully subscribes' do
    stub_connection current_user: user
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription.current_user.id).to eq(user.id)
    subscription.unsubscribe_from_channel
  end

  it 'successfully unsubscribe' do
    stub_connection current_user: user
    subscribe
    expect(subscription).to be_confirmed
    subscription.unsubscribe_from_channel
  end
end
