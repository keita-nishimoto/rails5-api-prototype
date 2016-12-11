class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    api_response = {
      sub: @user.id,
      gender: @user.gender,
      birthdate: @user.birthdate,
      _embedded: {
        email: {
          id: @user.email.id,
          email: @user.email.email,
          email_verified: @user.email.email_verified
        },
        password: {
          id: @user.password.id,
          password_hash: @user.password.password_hash
        }
      }
    }

    render json: api_response
  end

  # POST /users
  def create
    if @user = User.create(user_params)
      render json: create_response, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: update_response
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {}).permit(
        :gender,
        :birthdate,
        email_attributes: [:email, :email_verified],
        password_attributes: [:password_hash]
      )
    end

    # show用のresponseを生成する
    #
    # @return [Hash]
    def show_response
      api_response = {
        sub: @user.id,
        gender: @user.gender,
        birthdate: @user.birthdate,
        _embedded: {
          email: {
            id: @user.email.id,
            email: @user.email.email,
            email_verified: @user.email.email_verified
          },
          password: {
            id: @user.password.id,
            password_hash: @user.password.password_hash
          }
        }
      }

      api_response
    end

    # create用のresponseを生成する
    #
    # @return [Hash]
    def create_response
      api_response = {
        _links: {
          self: {
            href: "/users/#{@user.id}"
          }
        },
        sub: @user.id,
        gender: @user.gender,
        birthdate: @user.birthdate,
        _embedded: {
          email: {
            id: @user.email.id,
            email: @user.email.email,
            email_verified: @user.email.email_verified
          },
          password: {
            id: @user.password.id,
            password_hash: @user.password.password_hash
          }
        }
      }

      api_response
    end

    # update用のresponseを生成する
    #
    # @return [Hash]
    def update_response
      create_response
    end
end
