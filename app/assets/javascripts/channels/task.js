$(document).ready(function(){
  App.task = App.cable.subscriptions.create('TaskChannel', {
        connected: function() {
          console.log('Connected to rates channel');
        },
        received: function(data) {
          console.log(data);
        }
    });
})
