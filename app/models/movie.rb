class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates_presence_of :title
  validate :image_type

  def image_type
    if image.attached? && !image.content_type.in?(%w(image/png))
      errors.add(:image, 'must be jpeg, jpg or png')
    elsif image.attached? == false
      errors.add(:image, 'movie must have a image')
    end
  end

  has_one_attached :image

  has_many :ratings, dependent: :destroy

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

before_save :check_cropping

def check_cropping
  self.crop_settings = {x: crop_x, y: crop_y, w: crop_w, h: crop_h} if cropping?
end

def cropping?
  !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
end

def thumb(size = '270x370')
  if image.attached?
    if crop_settings.is_a? Hash
      dimensions = "#{crop_settings['w']}x#{crop_settings['h']}"
      coord = "#{crop_settings['x']}+#{crop_settings['y']}"
      image.variant(
      crop: "#{dimensions}+#{coord}",
      resize: size
      ).processed
    else
      image.variant(resize: size).processed
    end
  end
end

def thumbnail(size = '135x185')
  if image.attached?
    if crop_settings.is_a? Hash
      dimensions = "#{crop_settings['w']}x#{crop_settings['h']}"
      coord = "#{crop_settings['x']}+#{crop_settings['y']}"
      image.variant(
      crop: "#{dimensions}+#{coord}",
      resize: size
      ).processed
    else

    end
  end
end

def small(size = '54x74')
  if image.attached?
    if crop_settings.is_a? Hash
      dimensions = "#{crop_settings['w']}x#{crop_settings['h']}"
      coord = "#{crop_settings['x']}+#{crop_settings['y']}"
      image.variant(
      crop: "#{dimensions}+#{coord}",
      resize: size
      ).processed
    else
      image.variant(resize: size).processed
    end
  end
end

  def rating_count
    if self.ratings.any?
      (self.ratings.sum(:rating_value)/self.ratings.count).to_i
    else
      0
    end
  end
end
