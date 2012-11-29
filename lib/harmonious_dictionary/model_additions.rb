# encoding: utf-8

module HarmoniousDictionary
  module ModelAdditions
    def validate_harmonious_of(*attr_names)
      configuration = {message:'不能含有敏感词'}
      configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
      validates_each attr_names do |model, attribute, value| 
        model.errors.add(attribute, configuration[:message]) unless HarmoniousDictionary.clean?(value)
      end
    end

    def profanity_filter!(*attr_names)
      attr_names.each { |attr_name| setup_callbacks_for(attr_name) }
    end
    
    def profanity_filter(*attr_names)
      attr_names.pop[:method] rescue nil if attr_names.last.is_a?(Hash)

      attr_names.each do |attr_name| 
        instance_eval do
          define_method "#{attr_name}_clean" do; HarmoniousDictionary.clean(self[attr_name.to_sym]); end      
          alias_method attr_name.to_sym, "#{attr_name}_clean".to_sym
        end
      end
    end
    
    def setup_callbacks_for(attr_name)
      before_validation do |record|
        record[attr_name.to_sym] = HarmoniousDictionary.clean(record[attr_name.to_sym])
      end
    end
    
  end
end