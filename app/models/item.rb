# entity of items table

require 'elasticsearch/model'
require 'elasticsearch/dsl'

class Item < ActiveRecord::Base
  include Elasticsearch::Model
  has_many :item_images


  index_name 'columbus'
  document_type 'items'

  # search by elasticsearch
  # @param[String] q :search word
  def self.search(params = {})
    keyword = params[:q]

    search_definition = Elasticsearch::DSL::Search.search {
      query {
        if keyword.present?
          multi_match {
            query keyword
            fields %w{ characteristic }
          }
        else
          match_all
        end
      }
    }

    __elasticsearch__.search(search_definition)
  end
end
