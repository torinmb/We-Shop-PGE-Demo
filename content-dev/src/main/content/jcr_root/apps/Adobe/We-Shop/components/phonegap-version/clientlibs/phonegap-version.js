
;(function (angular, window, undefined) {
    "use strict";

    angular.module('phonegapVersion', ['btford.phonegap.ready'])
        .controller('VersionCtrl', ['$scope', 'phonegapReady', 
            function ($scope, phonegapReady) {

            $scope.version = undefined;
            var determineVersion = phonegapReady(function() {
                if (window.cordova && window.cordova.getAppVersion) {
                    window.cordova.getAppVersion(function(version) {
                       $scope.version = version;
                    });
                }
            });
            determineVersion();
        ]);

}(angular, window));