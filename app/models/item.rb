class Item < ApplicationRecord
  belongs_to :list
  validates :title, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }, if: -> { url.present? }
  validates :url, format: { with: %r{https?://.+} }, if: -> { url.present? }
end
