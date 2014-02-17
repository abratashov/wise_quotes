'use strict';

angular.module('quotes').controller('quotesController', ['$scope', 'quotesFactory', '$routeParams',
  function ($scope, quotesFactory, $routeParams) {
    $scope.status;
    $scope.quotes;

    $scope.getQuotes = function() {
      quotesFactory.getQuotes()
      .success(function (quotes) {
        $scope.quotes = quotes;
      })
      .error(function (error) {
        $scope.status = 'Unable to load quote data: ' + error.message;
      });
    };

    $scope.getQuotes();
    //setInterval( function() { $scope.getQuotes(); } , 2000);

    $scope.createQuote = function () {
      quotesFactory.createQuote($scope.quote)
      .success(function (quote) {
        $scope.status = 'Inserted Customer! Refreshing customer list.';
        $scope.quotes.push(quote);
      }).
      error(function(error) {
        $scope.status = 'Unable to insert customer: ' + error.message;
      });
    };

    // $scope.deleteCustomer = function (id) {
    //     dataFactory.deleteCustomer(id)
    //     .success(function () {
    //         $scope.status = 'Deleted Customer! Refreshing customer list.';
    //         for (var i = 0; i < $scope.customers.length; i++) {
    //             var cust = $scope.customers[i];
    //             if (cust.ID === id) {
    //                 $scope.customers.splice(i, 1);
    //                 break;
    //             }
    //         }
    //         $scope.orders = null;
    //     })
    //     .error(function (error) {
    //         $scope.status = 'Unable to delete customer: ' + error.message;
    //     });
    // };
}]);

angular.module('quotes').controller('quoteController', ['$scope', 'quotesFactory', '$routeParams',
  function ($scope, quotesFactory, $routeParams) {
    console.log('quoteController===========================');
    $scope.status;
    $scope.quote;
    var id = $routeParams.quoteId

    if (id) $scope.getQuote(id);

    $scope.getQuote = function (id) {
      quotesFactory.getQuote(id)
      .success(function (quote) {
        $scope.status = 'Retrieved quote!';
        $scope.quote = quote;
      })
      .error(function (error) {
        $scope.status = 'Error retrieving quote! ' + error.message;
      });
    };


    // $scope.updateCustomer = function (id) {
    //     var cust;
    //     for (var i = 0; i < $scope.customers.length; i++) {
    //         var currCust = $scope.customers[i];
    //         if (currCust.ID === id) {
    //             cust = currCust;
    //             break;
    //         }
    //     }

    //     dataFactory.updateCustomer(cust)
    //       .success(function () {
    //           $scope.status = 'Updated Customer! Refreshing customer list.';
    //       })
    //       .error(function (error) {
    //           $scope.status = 'Unable to update customer: ' + error.message;
    //       });
    // };

}]);