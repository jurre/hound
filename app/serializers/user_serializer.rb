class UserSerializer < ActiveModel::Serializer
  attributes(
    :card_exists,
    :id,
    :refreshing_repos,
    :subscribed_repo_count,
    :tier_allowance,
    :username,
  )

  def card_exists
    object.stripe_customer_id.present?
  end

  def subscribed_repo_count
    object.subscribed_repos.count
  end

  def tier_allowance
    object.current_tier.allowance
  end
end
