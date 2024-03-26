class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Check if a subscription with the same endpoint already exists
    existing_subscription = Subscription.find_by(endpoint: params[:endpoint])

    if existing_subscription
      render json: { message: 'Subscription already exists' }, status: :conflict
    else
      @subscription = Subscription.new(
        endpoint: params[:endpoint],
        p256dh: params.dig(:keys, :p256dh), # Access nested hash properly
        auth: params.dig(:keys, :auth)      # Access nested hash properly
      )

      if @subscription.save
        render json: { message: 'Subscription created successfully' }, status: :created
      else
        render json: { error: 'Failed to create subscription' }, status: :unprocessable_entity
      end
    end
  end

  # Other controller actions...

  private

  def subscription_params
    params.require(:subscription).permit(:endpoint, keys: [:p256dh, :auth])
  end
end
