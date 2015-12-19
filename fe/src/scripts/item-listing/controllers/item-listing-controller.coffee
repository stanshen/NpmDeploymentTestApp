module.exports = ($scope, itemListingService, accountService) ->
  $scope.items = itemListingService.items
  $scope.id
  $scope.store = null
  $scope.getItem = ->
  	itemListingService.retrieveStores($scope.id).then (store) ->
      $scope.store = store
      console.log store

  $scope.getAccountStores = ->
    accountService.retrieveAccountStores(1).then(stores) ->
      console.log(stores)