extension microsoftGraph

resource myGraphApplication 'Microsoft.Graph/applications@v1.0' = {
  displayName: 'ContentAsCodeBicepTestSP'
  uniqueName: 'CacBicepTestGH'
}
