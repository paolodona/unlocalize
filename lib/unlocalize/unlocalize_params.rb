module Unlocalize::UnlocalizeParams
  extend ActiveSupport::Concern

  module ClassMethods

    # eg: unlocalize /*_date/   => :date,
    #                /*_amount/ => :numeric,
    #                /*_time/   => :time

    def unlocalize(attributes)
      before_filter -> { unlocalize_params(params, attributes) }
    end
  end

  private

  def unlocalize_params(params, attributes)
    params.each do |key, value|
      if value.is_a?(Hash)
        unlocalize_params(params[key], attributes)
      elsif value.is_a?(Array)
        value.each_with_index do |v,index|
          unlocalize_params(params[key][index], attributes) if v.is_a?(Hash)
        end
      else
        attributes.each do |regexp, type|
          if key =~ regexp
            params[key] = parse_localized(params[key], type, key)
            break
          end
        end
      end
    end
  end

  def parse_localized(original_value, type, key)
    return nil if original_value.blank?
    new_value = case type
               when :date    then Date.parse_localized(original_value).strftime("%Y-%m-%d") rescue original_value
               when :time    then Time.parse_localized(original_value).strftime("%Y-%m-%d %H:%M:%S") rescue original_value
               when :numeric then Numeric.parse_localized(original_value) rescue original_value
               else
                 raise "type '#{type}' not supported by UnlocalizeParams"
               end
    Rails.logger.info "Unlocalized parameter '#{key}' of type '#{type}': #{original_value.inspect} => #{new_value.inspect}"
    return new_value
  end

end
