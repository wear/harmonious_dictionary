# encoding: utf-8

module HarmoniousDictionary
  module ModelAdditions
    def validate_harmonious_of(attr_names, option = {})
      configuration = {message:'不能含有敏感词'}
      library = option.values[0].to_s
      configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
      validates_each attr_names do |model, attribute, value|
        unless value.blank?
          if option.size == 0
            model.errors.add(attribute, configuration[:message]) unless HarmoniousDictionary.clean?(value)
          else
            model.errors.add(attribute, configuration[:message]) unless HarmoniousDictionary.clean?(value, library)
          end
        end
      end
    end
  end
end
