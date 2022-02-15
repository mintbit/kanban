class ApplicationComponent < ViewComponent::Base
  include Turbo::FramesHelper
  include Turbo::Streams::StreamName
  include Turbo::Streams::Broadcasts
  include Turbo::StreamsHelper
end
