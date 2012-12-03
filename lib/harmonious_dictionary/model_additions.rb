# encoding: utf-8

module HarmoniousDictionary
  module ModelAdditions
    def validate_harmonious_of(*attr_names)
      configuration = {message:'不能含有敏感词'}
      configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
      validates_each attr_names do |model, attribute, value|
        unless value.blank?
          model.errors.add(attribute, configuration[:message]) unless HarmoniousDictionary.clean?(value)
        end
      end
    end
  end
end