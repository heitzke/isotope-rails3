require 'acts_as_taggable_on/tag'
ActsAsTaggableOn::Tag.class_eval do
  before_save :create_slug
  validates_uniqueness_of :slug

  def patched?
    true
  end

  def create_slug
    self.slug ||= self.name.parameterize
  end

  def to_param
    slug
  end
end
