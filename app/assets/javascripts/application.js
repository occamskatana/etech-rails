// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .

var app = angular.module('App', ['ui.calendar', 'firebase']);


app.controller('CalendarCtrl', ['$scope', '$firebaseArray', function($scope, $firebaseArray) {

    var ref = new Firebase("https://e-tech.firebaseio.com/users/bdsimmons/events");

    
    $scope.events = $firebaseArray(ref)
    

    $scope.alertOnDrop = function(event, delta, revertFunc) {
     array = $scope.events

     record = array.$getRecord(event.$id)
     
     console.log(event._end.valueOf())

     record.start = event._start.valueOf()
     record.end = event._end.valueOf()

     array.$save(record)

    };

    $scope.events.$loaded(function(){

      $scope.uiConfig = {
        calendar:{
          editable: true,
          header:{
            left: 'month agendaWeek agendaDay',
            center: 'title',
            right: 'today prev,next'
          },
          events: $scope.events,
          // dayClick: $scope.alertEventOnClick,
          eventDrop: $scope.alertOnDrop,
          // eventResize: $scope.alertOnResize
        }
      };

    })

    /* config object */
   

    // $scope.events.$add({
    //   title: 'Test Event',
    //   start: moment().add(1, 'month').valueOf(),
    //   end: moment().add(1, 'month').valueOf() + 100000
    // });

}]);
