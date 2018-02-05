# Metric

Metric is a Rails application that offers analytic service of a few features such as allowing users to track events on their website with a client-side JavaScript snippet, a server-side API that saves those events to a database and displays it for the user.

Rails is always fun to make applications with and this little twist added to a web application allows me to see a different side of Rails.

Besides some of the usual gems for a Ruby on Rails application, this one also uses the following:

* Devise    - Authentication
* Faker     - Simulate a variety of tracked events
* Bootstrap - Responsive application
* Figaro    - Secured configuration of application

In addition, add this JavaScript code to the application you want to track:

```javascript
  var metric = {};
  metric.report = function(eventName){
    var event = {event: {name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Origin', 'http://localhost:####/');
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  }
```

  * Call with `<%= javascript_tag "metric.report(eventName)" %>`

  * Make sure the Application you are tracking is registered with the correct URL
