HTMLWidgets.widget({

  name: 'fullcalendar',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        x.height = height;
        // make row a JS object so essentially a list of rows rather than default list of cols
        x.events = HTMLWidgets.dataframeToD3(x.events);
        // TODO: code to render the widget, e.g.
        $(el).fullCalendar(x);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size
        $(el).fullCalendar('option', {
          height: height
        });
      }

    };
  }
});
