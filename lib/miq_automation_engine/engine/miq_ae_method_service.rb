module MiqAeMethodService
  def self.const_missing(name)
    return super if !defined?(MiqAeMethodService) && name == :MiqAeMethodService

    horrible_list = [
      :MiqAeServiceModelBase,
      :MiqAeServiceModelLegacy,
      :MiqAeServiceObject,
      :MiqAeService,
      :MiqAeServiceFront,
      :MiqAeServiceVmdb,
      :MiqAeServiceObjectCommon,
      :MiqAeServiceRbac,
      :MiqAeServiceConverter,
      :MiqAeServiceMethods,
      :Deprecation
    ].each do |thing|
      return super if name == thing && !MiqAeMethodService.const_defined?(thing)
    end

    if MiqAeServiceModelBase.respond_to?(:create_service_model_from_name)
      MiqAeServiceModelBase.create_service_model_from_name(name)
    else
      super
    end
  end
end

Dir.glob(Pathname.new(__dir__).join("miq_ae_method_service/*.rb")) do |file|
  require_relative "miq_ae_method_service/#{File.basename(file)}"
end
