<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!--  
<script type="text/javascript">
			var webSocket = new WebSocket(
											//'ws://localhost:9763/outputwebsocket/WebSocketLocalAdapter/senddata'
											'ws://localhost:8080/_025_WebSocketTest5/chatsocket'
																												);
											
			var replyElem = document.getElementById('reply');

			
			webSocket.onopen = function(message) {
				replyElem.value += "Opening connection...\n";
				//replyElem.write("Opening connection...\n");
			};
			webSocket.onclose = function(message) {
				replyElem.value += "Closing connection...\n";
			};
			webSocket.onmessage = function(message) {
				replyElem.value += "Received message > " + message.data + "...\n";	
								
				var xml=message.data;

				
				
				var string1=xml.split("<driverID>");
				var string2=string1[1].split("</driverID>");
				
				var name=string2[0];

				string1=xml.split("<lat>");
				string2=string1[1].split("</lat>");

				var lat=string2[0];

				
				string1=xml.split("<lon>");
				string2=string1[1].split("</lon>");

				var lon=string2[0];
								
				replyElem.value += "Received message > " + message.data + "...\n\n"+"Real data = "+name
									+" "+lat+" "+lon;
			};
			webSocket.onerror = function(message) {
				replyElem.value += "Processing error...\n";
			};
			
			
		</script>
-->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE&sensor=false"></script>
		<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=drawing&sensor=false"></script>
		<style type="text/css">
			#mapcan{
				height:100%;
				
			}
		</style>
		<script type="text/javascript" >
		//fires when all the html content is loaded properly
		google.maps.event.addDomListener(window, 'load', function(){
			
		
			//i have created a array of lat and lon to demo
			oblatlan = [
				[52.418916,5.877760],
				[52.528866,6.102785],
				[52.558432,5.906576]
				
				
			];
		
			/*
			  when there is more then one location is marked we need to find the center of the map unless
			  markes will be out of the visible area. to do that we first create an empty bound 
			  then we will extend it marker by marker and finally calling map.fitBounds() will set the viewport to contian
			  the bounds
			*/
			var bounds = new google.maps.LatLngBounds();
			var mapoptions = { zoom:6 }; //map options 
			var map = new google.maps.Map(document.getElementById('mapcan'), mapoptions);
			
			map.markers = []; 
			for(var i=0;i<oblatlan.length; i++)
			{
				
				var poiLatLang = new google.maps.LatLng( oblatlan[i][0], oblatlan[i][1]);
				//creating a new node
				var marker = new google.maps.Marker({
					position: poiLatLang ,
					map: map
					
				});
				//Extends this bounds to contain the given point.
				bounds.extend(marker.position);
				map.markers.push(marker);
			}
			
			//Sets the viewport to contain the given bounds.
			map.fitBounds(bounds);

		});
		</script>
	</head>
	<body>
		<div id="mapcan"></div>
		
	<!--	<p>
	  <textarea id="reply" placeholder="WebSocket reply will appear hear" style="width:400px; height:300px;"></textarea>

</p>-->



		
	</body>
</html>