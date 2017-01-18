module ItemsHelper
  require 'rqrcode_png'

  # itemデータをDBに格納する際のパラメータチェック
  # permitされていないパラメータはここで弾かれる
  def post_params
    params.require(:item).permit(:pick_date, :characteristic, :pick_location, :manage_location, :image_ids)
  end

  # QRコードを生成する
  def create_code(item_id)
    qr = RQRCode::QRCode.new(item_id, :size => 3, :level => :h)
    png = qr.to_img
    png.resize(200,200).save("public/test_code.png")
  end

  

end
