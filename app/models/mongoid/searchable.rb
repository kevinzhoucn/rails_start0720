# coding: utf-8
# 基本 Model，加入一些通用功能
module Mongoid
  # BaseModel
  module Searchable
    extend ActiveSupport::Concern

    module ClassMethods
      def search(key)
        if key
          where(title: /#{key}/i)
        end
      end
    end
  end
end