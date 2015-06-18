app.controller('SongsCtrl', function($scope, $http) {
  $http.get("http://localhost:3002/api/songs.json")
  .success(function(response) {$scope.songs = response.songs;});
});
