# coding: utf-8

class ItemsController < ApplicationController
  protect_from_forgery except: [:create]
  include ItemsHelper

  # insert Item data to DB
  # post /v1/items/
  # @param[Hash] attribute of Item class
  # @return[HttpStatus]
  def create
    item = Item.new(post_params)
    item.status = '管理中'
    item.save
    render :nothing => true, :status => 201
  end

  # search item entity by elasticsearch
  # get /v1/items
  # @param[String] search word
  # @return[JSON] search result
  def search
    item = Item.search(params)
    render :json => item
  end

  # update item entity
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

  # delete item entity
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

end
