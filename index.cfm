<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Sent Events</title>


    <script>


    function startListening(){
        const evtSource = new EventSource("event.cfm?name=bob");
        evtSource.onmessage = function(event) {
            
            
            console.log(event);
            const newElement = document.createElement("li");
            const eventList = document.getElementById("list");

            newElement.textContent = "message: " + event.data;
            eventList.appendChild(newElement);

            if(event.type == "abort"){
                evtSource.close();
            }
            if(event.data == "done"){
                evtSource.close();
            }
        }
    }
       
    </script>
</head>
<body>
    <h1>Server Sent Events Demo</h1>
    <button onClick="startListening();">Start Listening</button>
    <div>
        <ul id="list"></ul>
    </div>
    
</body>
</html>