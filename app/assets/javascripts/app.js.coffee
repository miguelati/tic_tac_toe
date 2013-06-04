window.App = angular.module('TicTacToe', [])
window.App.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/begin',
    templateUrl: '/begin'
    controller: BeginCtrl
  $routeProvider.when '/game', 
    templateUrl: '/game'
    controller: GameCtrl
  $routeProvider.when '/end',
    templateUrl: '/end'
    controller: EndCtrl
]