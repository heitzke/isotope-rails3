require 'minitest_helper'

describe ActsAsTaggableOn::Tag do
  before do
    @tag = ActsAsTaggableOn::Tag.create name: "Tag Name"
  end

  it "should have a slug" do
    @tag.slug.shoul_not be_nil
  end
end
