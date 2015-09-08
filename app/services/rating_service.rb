require 'statistics2'

class RatingService
  attr_accessor :post

  def self.recalculate_rating_for!(post)
    new(post).recalculate_rating!
  end

  def initialize(post)
    @post = post.kind_of?(Post) ? post : Post.find(post)
  end

  def recalculate_rating!
    post.update_attributes! rating: confidence_interval
  end

  private
    # Lower bound of Wilson score interval
    # https://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval#Wilson_score_interval_with_continuity_correction
    def confidence_interval(confidence=0.95)
      positive = post.votes.positive.count
      total    = post.votes.count
      return 0.0 if total == 0

      # Constant for confidence eq 0.95
      quantile = confidence == 0.95 ? 1.96 : Statistics2.pnormaldist(1-(1-confidence)/2)
      positives_fraction = 1.0 * positive / total

      return (
        (
          positives_fraction +
          quantile * quantile / (2 * total) -
          quantile * Math.sqrt((positives_fraction * (1 - positives_fraction) +
          quantile * quantile / (4*total) ) / total)
        ) /
        (1 + quantile * quantile / total)
      )
    end
end
