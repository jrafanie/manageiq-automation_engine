module MiqAeMethodService
  class MiqAeServiceVmCloudReconfigureRequest < MiqAeServiceMiqRequest
    require_dependency "service_models/mixins/miq_ae_service_miq_provision_quota_mixin"
    include MiqAeServiceMiqProvisionQuotaMixin
    def ci_type
      'vm'
    end
  end
end
