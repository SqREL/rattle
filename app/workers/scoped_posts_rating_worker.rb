class ScopedPostsRatingWorker

  # Minutes
  RECURRENT_RUN = 10

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # Preventing high load
  # https://github.com/tobiassvn/sidetiq/wiki/Known-Issues#ice_cube
  recurrence { hourly.minute_of_hour((60 / RECURRENT_RUN).enum_for(:times).map { |x| x * RECURRENT_RUN }) }
  sidekiq_options :queue => :scoped_posts_rating

  def perform
    refresh_queue = Post.voted_for_in_last(RECURRENT_RUN.minutes.ago).pluck(:id)
    refresh_queue.each do |post_id|
      PostRatingRecalculatorWorker.perform_async(post_id)
    end
  end
end