window.App = angular.module 'TicTacToe', []

App.controller 'TicTacToeCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.is_your_turn = true
  $scope.spaces = ['blank','blank','blank','blank','blank','blank','blank','blank','blank']
  $scope.status = "Podes comenzar haciendo click.. vas a ser cruz"
  
  $scope.mark = (index) ->
    if $scope.is_your_turn && $scope.spaces[index] == "blank"
      $scope.is_your_turn = false
      $scope.spaces[index] = 'cross'
      $scope.status = 'Esperame que ya juego'
      $http.post('api/tictactoe', {spaces: $scope.spaces}).success (data) ->
        console.log(data)
        if data['finnish']
          if data['winner'] == "user"
            $scope.status = "Has ganado, tuviste mucha suerte"
          else if data['winner'] == "computer"
            $scope.spaces[data['position']] = 'circle'
            $scope.status = "Gané yo, que esperabas"
          else
            $scope.status = "Ha sido un empate, tuviste suerte"
        else
          $scope.spaces[data['position']] = 'circle'
          $scope.is_your_turn = true
          $scope.status = 'Ya jugué, ahora es tu turno'
]