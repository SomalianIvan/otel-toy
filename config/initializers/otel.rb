ENV['OTEL_TRACES_EXPORTER'] = 'jaeger'
ENV['OTEL_SERVICE_NAME'] = 'toy_app'
ENV['OTEL_SERVICE_VERSION'] = '0.6.0'
ENV['OTEL_EXPORTER_JAEGER_AGENT_HOST'] = '127.0.0.1'
ENV['Test'] = 'test'


OpenTelemetry::SDK.configure do |c|
  c.use 'OpenTelemetry::Instrumentation::GraphQL', {
    # The following options are disabled by default as they generate
    # large traces, but can be enabled using the following keys to add
    # spans that provide more detail.
    # Further details about what these keys correspond can be found on the [platform_tracing.rb class](https://github.com/rmosolgo/graphql-ruby/blob/1.10.x/lib/graphql/tracing/platform_tracing.rb#L28-L73).
    # enable_platform_field maps to the execute_field and execute_field_lazy keys
    enable_platform_field: true,
    # enable_platform_authorized maps to the authorized and authorized_lazy keys
    enable_platform_authorized: true,
    # enable_platform_resolve_type maps to the resolve_type and resolve_type_lazy keys
    enable_platform_resolve_type: true
  }
end
