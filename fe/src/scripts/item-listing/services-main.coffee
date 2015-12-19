itemListingService = require './services/item-listing-service'
accountService = require './services/account-service'


app = angular.module('AngularBoilerPlate')
app
  .service('itemListingService', [
    '$resource'
    itemListingService
  ])
  .service('accountService', [
    '$resource'
    accountService
  ])
