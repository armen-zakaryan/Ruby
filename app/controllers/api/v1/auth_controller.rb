class Api::V1::AuthController < ActionController::Metal
  include AbstractController::Rendering
  include ActionController::ImplicitRender
  #include ActionController::Serialization
  #include ActiveModel::Serializer
  include ActionController::MimeResponds
  include AbstractController::Callbacks

  include ActionController::Renderers::All

  respond_to :json

  def index
    #respond_with User.all
    render json: User.all
  end

  # def index
  #   self.response_body = "{name:233, mio: 'armen'}"
  # end

  def show
    respond_with User.find(params[:id])
  end

  def create
    respond_with User.create(params[:user])
  end

  def update
    respond_with User.update(params[:id], params[:user])
  end

  def destroy
    respond_with User.destroy(params[:id])
  end

end
