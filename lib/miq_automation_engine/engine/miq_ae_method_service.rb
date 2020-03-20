module MiqAeMethodService
  def self.const_missing(name)
$miq_ae_logger.info("XXX #{__method__} 1 name: #{name.inspect}")
$miq_ae_logger.info("XXX #{__method__} 2a defined?(MiqAeMethodService): #{defined?(MiqAeMethodService).inspect}")
$miq_ae_logger.info("XXX #{__method__} 2b defined?(MiqAeServiceModelBase): #{defined?(MiqAeServiceModelBase).inspect}")

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
      $miq_ae_logger.info("XXX #{__method__} 3a calling create_service_model_from_name #{name}")
      MiqAeServiceModelBase.create_service_model_from_name(name)
    else
      $miq_ae_logger.info("XXX #{__method__} 3b calling super #{name}")
      super
    end
  end
end

Dir.glob(Pathname.new(__dir__).join("miq_ae_method_service/*.rb")) do |file|
  require_relative "miq_ae_method_service/#{File.basename(file)}"
end
