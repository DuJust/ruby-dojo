require_relative 'gateway/gateway_expression_builder'

module IntroduceExpressionBuilder
  class DomainObject

    def http
      GatewayExpressionBuilder.new(self)
    end
  end
end