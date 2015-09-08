class PostRatingRecalculatorWorker
  include Sidekiq::Worker

  sidekiq_options :queue => :post_rating_recalculator

  def perform(post_id)
    post = Post.find(post_id)
    RatingService.recalculate_rating_for!(post)
  end
end
