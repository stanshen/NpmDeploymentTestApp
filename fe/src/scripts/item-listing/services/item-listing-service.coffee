module.exports = ($resource)->
  _ret = [
    {name: 'store 1', id: 1}
    {name: 'store 2', id: 2}
    {name: 'store 3', id: 3}
  ]
  theService = {}

  Object.defineProperties theService, 
    items: get: ->
      _ret
    retrieveStores: value: (id)->
      Store = $resource('http://localhost:52720/api/store', {id: '@id'})
      Store.get({id: id}).$promise

