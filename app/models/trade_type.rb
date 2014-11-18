class TradeType < ActiveRecord::Base
  @@trade_types = nil

  #TODO homegrown solution...what's the better way?
  def self.all_cache
    if @@trade_types == nil
      @@trade_types = []

      raw_types = TradeType.all.order(:group, :type_id)
      raw_types.each do |trade_type|
        @@trade_types.push trade_type
      end
    end

    @@trade_types
  end

end
