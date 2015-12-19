app = angular.module("AngularBoilerPlate")

app.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$httpProvider'
  ($stateProvider, $urlRouterProvider, $httpProvider)->
    $stateProvider
    .state('home', {
      url: '/'
      templateUrl: './item-listing'
      controller: 'itemListingController'
      })
    .state('item-details', {
      url: '/item-details'
      templateUrl: './item-details'
      })
    .state('company-list', {
      url: '/company-list'
      templateUrl: './company-listing'
      })

    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common["X-Requested-With"]
    $httpProvider.defaults.headers.common["Accept"] = "application/json"
    $httpProvider.defaults.headers.common["Content-Type"] = "application/json"


  ]


