HTMLWidgets.widget({

  name: 'fullcalendar',

  type: 'output',

  factory: function(el, width, height) {

    var calendar = null;

    return {

      renderValue: function(x) {
        // fullCalendar doesn't accept width
        x.height = height;
        // make row a JS object so essentially a list of rows rather than default list of cols
        x.events = HTMLWidgets.dataframeToD3(x.events);

        calendar = $(el);
        // apparently destroying and rebuilding calendar each time data changes is significantly easier than using changeEvents
        if (calendar !== null) {
          calendar.fullCalendar("destroy");
        }

        calendar.fullCalendar(x);
        clientEvents = calendar.fullCalendar("clientEvents");

      },

      resize: function(width, height) {
        // fullCalendar doesn't accept width parameter
        calendar.fullCalendar('option', {
          height: height
        });
      }

    };
  }
});
