# encoding: utf-8

module HarmoniousDictionary
  module ModelAdditions
    def validate_harmonious_of(*attr_names)
      configuration = {message:'不能含有敏感词'}
      configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
      validates_each attr_names do |model, attribute, value|
        model.errors.add(attribute, configuration[:message]) unless clean?(value)
      end
    end

    def profanity_filter!(*attr_names)
      attr_names.each { |attr_name| setup_callbacks_for(attr_name) }
    end
    
    def profanity_filter(*attr_names)
      attr_names.pop[:method] rescue nil if attr_names.last.is_a?(Hash)

      attr_names.each do |attr_name| 
        instance_eval do
          define_method "#{attr_name}_clean" do
            # if Rails.configuration.harmonious_dictionary.use_remote_server 
              # HarmoniousDictionary.clean_by_remote(self[attr_name.to_sym])
            # else
              HarmoniousDictionary.clean(self[attr_name.to_sym])
            # end
          end  
          alias_method attr_name.to_sym, "#{attr_name}_clean".to_sym
        end
      end
    end
    
    def setup_callbacks_for(attr_name)
      before_validation do |record|
        # if Rails.configuration.harmonious_dictionary.use_remote_server 
          # record[attr_name.to_sym] = HarmoniousDictionary.clean_by_remote(record[attr_name.to_sym])
        # else
          record[attr_name.to_sym] = HarmoniousDictionary.clean(record[attr_name.to_sym])
        # end
      end
    end

    def clean?(input)
       HarmoniousDictionary.clean?(input)
    end
  end
end