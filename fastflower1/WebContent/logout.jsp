<!DOCTYPE html>

<html>

    <head>

        <title>Logout Page</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width">

    </head>
 <body align="right">
    <form method="post" action="logoutprocess.jsp">

    

        <input type="submit" value="Logout">
         welcome <%=session.getAttribute("usermail") %> pass <%=session.getAttribute("password") %>
   </form>
    </body>

</html>