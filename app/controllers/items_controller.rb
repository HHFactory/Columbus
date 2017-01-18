# coding: utf-8

class ItemsController < ApplicationController
  protect_from_forgery except: [:create]
  include ItemsHelper

  # itemデータをDBに格納する
  #
  # post /v1/items/
  # @param[Hash] attribute of Item class
  # @return[HttpStatus]
  def create
    item = Item.new(post_params)
    item.status = '管理中'
    item.save

    images = ItemImage.where(id: params[:image_ids])
    item.item_images = images

    render :nothing => true, :status => 201
  end

  # パラメータとして渡された検索ワードにて、Elasticsearchからデータを検索する
  # imageパスはESに格納していないため、ESから取得したitemIdをもとにDBからimageパスつきデータを取得
  #
  # get /v1/items
  # @param[String] search word
  # @return[JSON] search result
  def search
    response = Item.search(params)

    # elasticsearchで取得したidリストをもとに、DBからデータを取得
    # 画像パスはesに格納していないので、DBからデータを取得する
    items = Item.where(id: response.records.ids.to_a)

    render :json => items.all.to_json(:include => {:item_images => {:only => :url_path}}, :except => [:created_at, :updated_at])
  end

  # itemデータを更新する
  #
  # put /v1/items/:id
  # @param[String] item id
  # @param[hash] item attributes
  # @return[HttpStatus] 200 or 404
  def update
    item = Item.find_by(id: params[:id]) if params[:id]
    if item.nil?
      render :nothing => true, :status => 404 and return
    else
      item.update(post_params)
      render :nothing => true, :status => 200
    end
  end

  # itemデータを削除
  #
  # delete /v1/items/:id
  # @param[String] item id
  def delete
    item = Item.find_by(id: params[:id]) if params[:id]
    if item.nil?
      render :nothing => true, :status => 404 and return
    else
      item.destroy
      render :nothing => true, :status => 204
    end
  end

  # QRコードを表示する
  def display_code
    puts params
    create_code(params[:id])
    render :nothing => true
  end

end
