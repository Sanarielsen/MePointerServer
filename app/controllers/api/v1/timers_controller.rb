class Api::V1::TimersController < Api::V1::BaseController
  def index
    render json: [
    {
      id: 1,
      name: "Estuda os livros de programacao",
      timer_type_id: 1,
      created_at: Time.current,
      update_at: Time.current
    },
    {
      id: 2,
      name: "Estuda os livros de culinaria",
      timer_type_id: 1,
      created_at: Time.current,
      update_at: Time.current
    },
    {
      id: 3,
      name: "Descança vai",
      timer_type_id: 2,
      created_at: Time.current,
      update_at: Time.current
    }
    ], status: :ok
  end

  # Send a new row to insert
  def create
    render json: { id: 1 }, status: :created
  end

  # # Same of new???
  # def edit
  # end

  # # Load a specific row in a database
  # def show
  # end

  # # Can be partial or full, refresh data relatined by model
  # def update
  # end

  # # Delete a row folliwing the specific data you send
  # def destroy
  # end
end
