/**
 * Created by azakaryan on 13.08.2015.
 */





var app = angular.module('myApp', ['ngResource']);


//*****************
//**** Models *****
//*****************
app.service('HotelsSvc', ['$resource', function($resource){
    var actions = {
        getAll: {
            method: 'GET',
            params: {},
            cache: true,
            isArray: true,
            transformResponse: function(data) {
                if (typeof data === 'string'){
                    return JSON.parse(data)
                } else {
                    return data
                };
            }
        }
    };

    return $resource('/api/v1/auth', {}, actions);
}]);
//*****************
//** Controllers **
//*****************
app.controller('SearchCtrl', ['$scope', 'HotelsSvc', function($scope, HotelsSvc) {
    $scope.title = "Advanced Search";
    $scope.isSearchVisible = false;
    $scope.hotels = [];

    $scope.toggleSearch = function(){
        $scope.isSearchVisible = !$scope.isSearchVisible;
    }

    $scope.search = function(){
        HotelsSvc.getAll().$promise.then(function(data){
            $scope.hotels = data;
        });
    }
}]);





/*
 $(document).ready(
 function () {
 $('#h-search-btn').on('click', function(event){
 $('.h-search').toggleClass('content-visible');
 });
 });
 */
