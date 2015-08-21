class Api::V1::BaseController < ActionController::Metal

  include AbstractController::Rendering
  include ActionController::ImplicitRender
  #include ActionController::Serialization
  include ActionController::MimeResponds
  include AbstractController::Callbacks

end