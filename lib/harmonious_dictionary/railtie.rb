module HarmoniousDictionary
  class Railtie < Rails::Railtie
    # config.harmonious_dictionary = ActiveSupport::OrderedOptions.new
    # config.harmonious_dictionary.use_remote_server = false

    rake_tasks do
      load "tasks/generate_dictionary.rake"
    end

    initializer 'HarmoniousDictionary.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end

    # config.after_initialize do
    #   if config.harmonious_dictionary.use_remote_server
    #     Rseg.instance.load_remote_url_config
    #   end
    # end
  end
end