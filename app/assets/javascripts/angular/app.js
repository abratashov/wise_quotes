'use strict';

angular.module('app', ['ngRoute', 'ui.bootstrap', 'quotes']);
angular.module('quotes', []);

angular.module('quotes').config(['$routeProvider',
  function ($routeProvider) { $routeProvider.
    //when('/',                 {templateUrl: '/templates/pages/landing.html',        controller: 'applicationController'}).
    when('/',                 {templateUrl: '/assets/angular/quotes/views/index.html',         controller: 'appController'}).
    when('/quotes',           {templateUrl: '/assets/angular/quotes/views/index.html',         controller: 'quotesController'}).
    when('/quotes/new',       {templateUrl: '/assets/angular/quotes/views/show.html',         controller: 'quoteController'}).
    when('/quotes/:quoteId',  {templateUrl: '/assets/angular/quotes/views/show.html',         controller: 'quoteController'}).
    otherwise({ redirectTo: '/'});
  }]
);

angular.module('quotes').controller('appController', ['$scope', '$routeParams',
  function ($scope, $routeParams) {

  }]
);