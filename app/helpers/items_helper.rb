module ItemsHelper
  def post_params
    params.require(:item).permit(:pick_date, :characteristic, :pick_location, :manage_location)
  end
end
