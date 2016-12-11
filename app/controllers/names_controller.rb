class NamesController < ApplicationController
  before_action :set_name, only: [:show, :update, :destroy]
  before_action :set_user

  # GET /names
  def index
    @names = Name.all

    render json: @names
  end

  # GET /names/1
  def show
    render json: @name
  end

  # POST /users/1/names
  def create
    @name = @user.create_name(name_params)
    if @name
      render json: create_response, status: :created, location: "/users/#{@user.id}/names/#{@name.id}"
    else
      render json: @name.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1/names/1
  def update
    if @name.update(name_params)
      render json: @name
    else
      render json: @name.errors, status: :unprocessable_entity
    end
  end

  # DELETE /names/1
  def destroy
    @name.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name
      @name = Name.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def name_params
      params.fetch(:name, {}).permit(
        :user_id,
        :given_name,
        :family_name,
        :nickname,
        :preferred_username
      )
    end

    # create用のresponseを生成する
    #
    # @return [Hash]
    def create_response
      api_response = {
        _links: {
          self: {
            href: "/users/#{@user.id}/names/#{@name.id}"
          }
        },
        id: @name.id,
        given_name: @name.given_name,
        family_name: @name.family_name,
        nickname: @name.nickname,
        preferred_username: @name.preferred_username,
        _embedded: {
          user: {
            sub: @user.id,
            gender: @user.gender,
            birthdate: @user.birthdate,
          }
        }
      }

      api_response
    end
end
