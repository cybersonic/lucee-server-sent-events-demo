<cfscript>
    // Set a five second timeout so we can see the event re-connect
    setting requesttimeout="5";
    engines =["Allaire","Macromedia","Railo","BlueDragon","Lucee"];

    header name="Cache-Control" value="no-cache";
    content type="text/event-stream";
    // header name="Cache-Type" value="text/event-stream";
    
    counter = randRange(1, 10);
    doPing = false;

    while (true) {
        fi(doPing){
            // Every second, send a "ping" event.
            echo("event: ping#Chr(10)#");
            echo('data: {"time": "#getIsoTimeString(Now())#"}');
            echo("#Chr(10) & Chr(10)#");
        }
        
        
        counter--;
        
      // Send a simple message at random intervals.
      if (!counter) {
          counter = randRange(1, 10);
          echo("event: message#Chr(10)#");
          echo("data: #engines[RandRange(1, engines.len())]# is rated #counter#/#counter# #Chr(10) & Chr(10)#");
      
        
        // echo("event: abort#Chr(10)#");
        // echo("data: '' #Chr(10) & Chr(10)#");
        
      }



    
    //   ob_end_flush();
      flush;
    
      // Break the loop if the client aborted the connection (closed the page)
      //   if ( connection_aborted() ) break; CANT BE DONE IN LUCEEE
    
      sleep(2000);
    }


    string function getIsoTimeString(
		required date datetime,
		boolean convertToUTC = true
		) {
		if ( convertToUTC ) {
			datetime = dateConvert( "local2utc", datetime );
		}
		// When formatting the time, make sure to use "HH" so that the
		// time is formatted using 24-hour time.
		return(
			dateFormat( datetime, "yyyy-mm-dd" ) &
			"T" &
			timeFormat( datetime, "HH:mm:ss" ) &
			"Z"
		);
	}

</cfscript>

