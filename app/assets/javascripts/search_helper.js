/**
 * Created by azakaryan on 13.08.2015.
 */

var self = this;

$(document).ready(
    function () {
        $('#h-search-btn').on('click', function(event){
        $('.h-search').toggleClass('content-visible');
    });
});



var app = angular.module('myApp', []);

app.controller('SearchCtrl', ['$scope', function($scope) {

    $scope.submit = function(){
        debugger;
        $scope.key
    }
}]);
