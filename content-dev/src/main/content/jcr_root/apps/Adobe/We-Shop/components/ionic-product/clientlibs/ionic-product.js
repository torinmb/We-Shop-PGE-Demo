;(function (angular, window, undefined) {

    angular.module('ionicProduct', ['btford.phonegap.ready', 'ionic'])
        .controller('SlideController', ['$scope', 'phonegapReady', function ($scope, phonegapReady) {

                var setActiveSlide = phonegapReady(function() {
                    $scope.myActiveSlide = 0;
                });

                setActiveSlide();
            }
        ]);

}(angular, window));