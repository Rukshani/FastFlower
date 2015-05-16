<!DOCTYPE html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="fastflower1.connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="Rukshani">
    <title>Customer Details</title>
    
   
 <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAgrj58PbXr2YriiRDqbnL1RSqrCjdkglBijPNIIYrqkVvD1R4QxRl47Yh2D_0C1l5KXQJGrbkSDvXFA"
      type="text/javascript"></script>
    <script type="text/javascript">

 function load() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map"));
        map.addControl(new GSmallMapControl());
        map.addControl(new GMapTypeControl());
        var center = new GLatLng(48.89364,  	2.33739);
        map.setCenter(center, 15);
        geocoder = new GClientGeocoder();
        var marker = new GMarker(center, {draggable: true});  
        map.addOverlay(marker);
        document.getElementById("lat").innerHTML = center.lat().toFixed(5);
        document.getElementById("lng").innerHTML = center.lng().toFixed(5);

	  GEvent.addListener(marker, "dragend", function() {
       var point = marker.getPoint();
	      map.panTo(point);
       document.getElementById("lat").innerHTML = point.lat().toFixed(5);
       document.getElementById("lng").innerHTML = point.lng().toFixed(5);

        });


	 GEvent.addListener(map, "moveend", function() {
		  map.clearOverlays();
    var center = map.getCenter();
		  var marker = new GMarker(center, {draggable: true});
		  map.addOverlay(marker);
		  document.getElementById("lat").innerHTML = center.lat().toFixed(5);
	   document.getElementById("lng").innerHTML = center.lng().toFixed(5);


	 GEvent.addListener(marker, "dragend", function() {
      var point =marker.getPoint();
	     map.panTo(point);
      document.getElementById("lat").innerHTML = point.lat().toFixed(5);
	     document.getElementById("lng").innerHTML = point.lng().toFixed(5);

        });
 
        });

      }
    }

	   function showAddress(address) {
	   var map = new GMap2(document.getElementById("map"));
       map.addControl(new GSmallMapControl());
       map.addControl(new GMapTypeControl());
       if (geocoder) {
        geocoder.getLatLng(
          address,
          function(point) {
            if (!point) {
              alert(address + " not found");
            } else {
		  document.getElementById("lat").innerHTML = point.lat().toFixed(5);
	   document.getElementById("lng").innerHTML = point.lng().toFixed(5);
		 map.clearOverlays()
			map.setCenter(point, 14);
   var marker = new GMarker(point, {draggable: true});  
		 map.addOverlay(marker);

		GEvent.addListener(marker, "dragend", function() {
      var pt = marker.getPoint();
	     map.panTo(pt);
      document.getElementById("lat").innerHTML = pt.lat().toFixed(5);
	     document.getElementById("lng").innerHTML = pt.lng().toFixed(5);
        });


	 GEvent.addListener(map, "moveend", function() {
		  map.clearOverlays();
    var center = map.getCenter();
		  var marker = new GMarker(center, {draggable: true});
		  map.addOverlay(marker);
		  document.getElementById("lat").innerHTML = center.lat().toFixed(5);
	   document.getElementById("lng").innerHTML = center.lng().toFixed(5);

	 GEvent.addListener(marker, "dragend", function() {
     var pt = marker.getPoint();
	    map.panTo(pt);
    document.getElementById("lat").innerHTML = pt.lat().toFixed(5);
	   document.getElementById("lng").innerHTML = pt.lng().toFixed(5);
        });
 
        });

            }
          }
        );
      }
    }
    </script>
<script type="text/javascript">
//<![CDATA[
var gs_d=new Date,DoW=gs_d.getDay();gs_d.setDate(gs_d.getDate()-(DoW+6)%7+3);
var ms=gs_d.valueOf();gs_d.setMonth(0);gs_d.setDate(4);
var gs_r=(Math.round((ms-gs_d.valueOf())/6048E5)+1)*gs_d.getFullYear();
var gs_p = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%3Cscript src='" + gs_p + "s.gstat.orange.fr/lib/gs.js?"+gs_r+"' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>






<style type="text/css">
.form-group form #map {
	left: 738px;
	top: 157px;
}
</style></head>

<body onload="load()" onunload="GUnload()" background="imagesdemo/b.jpg">
<div class="navbar navbar-inverse" role="navigation">



      <div class="container">
        <div class="navbar-header">
        
           <div align="right">
	    	   <form method="post" action="../logoutprocess.jsp">
	    			<%=session.getAttribute("usermail") %>
					<input type="submit" value="Logout"></input>
				</form>
    	   </div>
          <h1><font color="#FF6699">Customer Details</font></h1>
           
        </div>
      </div>
</div>


		

<div class="form-group" id="myDiv">
  <form action="" onsubmit="showAddress(this.address.value); return false">
    <table>
     <p><h2>Destination Address:</h2>        
      <tr><td><input type="text" size="60" name="address" placeholder="City" /></td>
      	  <td><input type="submit" value="Search" /></td></tr>
      </form>
      	<form action="../orderdelivery">
	      <tr><td><input type="text" size="60" name="address1" placeholder="Address Line1"/></td></tr>
	      <tr><td><input type="text" size="60" name="address2" placeholder="Address Line2"/></td></tr>
	      <tr><td><input type="datetime" size="60" name="dt" placeholder="Time to be delivered" id="dt"/></td>
	      	  <td><input type="button" value="Calculate" onclick="calculate()"/></td></tr>
	      <tr><td id="duetime">Due Time:
	      			
	      
	      </td></tr>
	      <tr><td><input type="text" size="60" name="note" placeholder="Special Note"/></td></tr>
	      <tr><td><button type="submit" class="btn btn-primary">Save</button></td></tr>
      </p>
    </table>
    <div align="center" id="map" style="position: absolute; width: 600px; height: 400px"><br/>
    </div>
  </form>

 <p align="left">
 
 <table  bgcolor="#FFFFCC" width="300">
  <tr>
    <td><b>Latitude</b></td>
    <td><b>Longitude</b></td>
  </tr>
  <tr>
    <td id="lat"></td>
    <td id="lng"></td>
  </tr>
</table>
 </p>
  <p>
  </p>
  </div>


<script type="text/javascript">
	if (typeof _gstat != "undefined") _gstat.audience('','pagesperso-orange.fr');
</script>

    
           
<div class="container">
	<h1><font color="#FF6699">Payments</font></h1>
	<div class="row">
		<div class="col-md-4">
        <table>
			<form role="form">
                <tr>
					<td><label>Cardholder's Name</label></td>
					<td><input type="text" class="form-control"></td>
                </tr>
                <tr>
					<td><label>Card Number</label></td>
					<td><input type="text" class="form-control"></td>
                </tr>
                <tr>
					<td><label>Exp Month</label></td>
					<td><input type="text" class="form-control" placeholder="MM"></td>
                </tr>
				<tr>
					<td><label>Exp Year</label></td>
					<td><input type="text" class="form-control" placeholder="YYYY"></td>
                </tr>
				<tr>
					<td><label>CVC</label></td>
					<td><input type="text" class="form-control" placeholder="Ex. 331"></td>
                </tr>
                <br/>
                <tr><td><button type="submit" class="btn btn-primary">Pay Now</button></td></tr>
			</form>
            </table>
            </div>
            </div>
            </div>
            
 
<script>
function calculate()
{
var xmlhttp;
var duetime=document.getElementById("dt").value;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("duetime").innerHTML="Due Time: "+xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","../orderdelivery?dt="+duetime,true);
xmlhttp.send();
}
</script>         
            
</body>
</html>






