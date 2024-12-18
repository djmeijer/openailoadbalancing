param apimServiceName string
param openAILoadBalancingConfigName string
param openAILoadBalancingConfigValue string
param openAIFairUseConfigName string
param openAIFairUseConfigValue string


resource apim 'Microsoft.ApiManagement/service@2023-05-01-preview' existing = {
  name: apimServiceName
}


// advance-load-balancing: added a naned value resource
resource openAILoadBalancingNamedValue 'Microsoft.ApiManagement/service/namedValues@2023-05-01-preview' = {
  name: openAILoadBalancingConfigName
  parent: apim
  properties: {
    displayName: openAILoadBalancingConfigName
    secret: false
    value: openAILoadBalancingConfigValue
  }
}

// advance-load-balancing: added a naned value resource
resource openAIFairUseConfigNamedValue 'Microsoft.ApiManagement/service/namedValues@2023-05-01-preview' = {
  name: openAIFairUseConfigName
  parent: apim
  properties: {
    displayName: openAIFairUseConfigName
    secret: false
    value: openAIFairUseConfigValue
  }
}

