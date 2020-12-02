class VideoTagRelation < ApplicationRecord

  belongs_to :video
  belongs_to :tag
end
