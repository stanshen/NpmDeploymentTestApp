module.exports = ($resource)->
  Object.defineProperties {},
    retrieveAccountStores: value: (id) ->
      Stores = $resource('http://localhost:52720/api/account/:id/store', {id: "@id"})
      Stores.get({id: id}).promise