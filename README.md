# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Using Gem mailcatcher but not in Gemfile

Add this JavaScript code to the application you want to track:

  var metric = {};
  metric.report = function(eventName){
    var event = {event: {name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Origin', 'http://localhost:####/');
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  }

  * Call with `<%= javascript_tag "metric.report(eventName)" %>`
  
  * Make sure the Application you are tracking is registered with the correct URL
