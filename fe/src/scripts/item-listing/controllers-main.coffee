itemListingController = require './controllers/item-listing-controller'

app = angular.module('AngularBoilerPlate')
app.controller('itemListingController', [
  '$scope'
  'itemListingService'
  'accountService'
  itemListingController
  ])