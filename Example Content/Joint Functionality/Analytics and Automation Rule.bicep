param workspace string

resource workspace_Microsoft_SecurityInsights_ed27aa54_2adc_4774_ae30_6f84a1de0213 'Microsoft.OperationalInsights/workspaces/providers/alertRules@2021-03-01-preview' = {
  name: '${workspace}/Microsoft.SecurityInsights/ed27aa54-2adc-4774-ae30-6f84a1de0266'
  kind: 'Scheduled'
  properties: {
    displayName: 'Bicep Analytic Rule 1 - test smart tracking'
    description: 'DESCRIPTION CHECK'
    severity: 'High'
    enabled: true
    query: 'SecurityAlert'
    queryFrequency: 'PT5H'
    queryPeriod: 'PT5H'
    triggerOperator: 'GreaterThan'
    triggerThreshold: 0
    suppressionDuration: 'PT5H'
    suppressionEnabled: false
    tactics: []
    alertRuleTemplateName: null
    incidentConfiguration: {
      createIncident: true
      groupingConfiguration: {
        enabled: false
        reopenClosedIncident: false
        lookbackDuration: 'PT5H'
        matchingMethod: 'AllEntities'
        groupByEntities: []
        groupByAlertDetails: []
        groupByCustomDetails: []
      }
    }
    eventGroupingSettings: {
      aggregationKind: 'SingleAlert'
    }
    alertDetailsOverride: {
      alertDisplayNameFormat: 'alert name {{AlertName}}'
      alertDescriptionFormat: 'DESC test {{Description}}'
      alertTacticsColumnName: null
      alertSeverityColumnName: null
    }
    customDetails: null
    entityMappings: null
  }
}

resource workspace_Microsoft_SecurityInsights_85f2eac9_43f1_480e_b8ad_473375c195c0 'Microsoft.OperationalInsights/workspaces/providers/automationRules@2019-01-01-preview' = {
  name: '${workspace}/Microsoft.SecurityInsights/85f2eac9-43f1-480e-b8ad-473375c195c0'
  kind: 'Scheduled'
  properties: {
    displayName: 'Bicep automation rule 1'
    order: 1
    triggeringLogic: {
      isEnabled: true
      expirationTimeUtc: null
      triggersOn: 'Incidents'
      triggersWhen: 'Created'
      conditions: [
        {
          conditionType: 'Property'
          conditionProperties: {
            propertyName: 'IncidentTactics'
            operator: 'Contains'
            propertyValues: [
              'Persistence'
            ]
          }
        }
      ]
    }
    actions: [
      {
        order: 1
        actionType: 'ModifyProperties'
        actionConfiguration: {
          owner: {
            objectId: 'b18ef471-be11-439d-9279-5ce4e18b976e'
            email: 'SampleEmail@Contoso.com'
            userPrincipalName: 'SampleUser@Contoso.com'
          }
        }
      }
    ]
  }
}
