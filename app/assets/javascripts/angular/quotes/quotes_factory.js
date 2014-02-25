'use strict';

angular.module('quotes').factory('quotesFactory',
  ['$http', function($http) {
    var urlBase = config.server_ip + '/api/v1/quotes';
    var quotesFactory = {};

    quotesFactory.getQuotes = function () {
      return $http.get(urlBase);
    };

    quotesFactory.getQuote = function (id) {
      return $http.get(urlBase + '/' + id);
    };

    quotesFactory.createQuote = function (quote) {
      return $http.post(urlBase, quote);
    };

    quotesFactory.updateQuote = function (quote) {
      return $http.put(urlBase + '/' + quote.ID, quote)
    };

    quotesFactory.deleteQuote = function (id) {
      return $http.delete(urlBase + '/' + id);
    };

    return quotesFactory;
  }]
);