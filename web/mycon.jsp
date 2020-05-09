<%-- 
    Document   : mycon
    Created on : 26 Jul, 2017, 3:01:29 PM
    Author     : S7
--%>

<%@page import="doctorsearch.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function chk(v)
            {
             if(isNaN(v.t5.value))
             {
                 alert("must enter number");
                 v.t5.value="";
                 v.t5.focus();
                 return false;
             }
             return true;
            }
            
        </script>
              <%!
    private static String getD(int dayofWeek) {

		String dayName = null;
		switch (dayofWeek) {
		case 1:
			dayName = "Sunday";
			break;
		case 2:
			dayName = "Monday";
			break;
		case 3:
			dayName = "Tuesday";
			break;
		case 4:
			dayName = "Wednesday";
			break;
		case 5:
			dayName = "Thursday";
			break;
		case 6:
			dayName = "Friday";
			break;
		case 7:
			dayName = "Saturday";
			break;
		}
		return dayName;
	}
    %>
        <title>JSP Page</title>
    </head>
    <body>
        <form  method="post" action="mycon" onsubmit="return chk(this);">
        <table>
            <tr>
            <td>day</td>
            <td><select name="t2">
                    <option value="1">sun</option>
                    <option value="2">mon</option>
                    <option value="3">thu</option>
                    <option value="4">wed</option>
                    <option value="5">thes</option>
                    <option value="6">fri</option>
                    <option value="7">sat</option>
                </select></td></tr>
             <tr>
           
              <tr>
            <td>time from</td>
            <td><input type="text" name="t3" required=""/></td></tr>
               <tr>
            <td>time to</td>
            <td><input type="text" name="t4" required=""/></td></tr>
                <tr>
            <td>no of booking</td>
            <td><input type="text" name="t5" required="" maxlength="4"/></td></tr>
                 <tr>
            <td></td>
            <td><input type="submit" name="se" value="save" /></td></tr>
        </table></form>
        <hr />
        <table border="1" class="table">
         
            <tr>
                <td >day</td>
            
                  <td>From</td>
                   <td>To</td>
                   <td >no of booking per day</td>
                     <td ></td>
                    
            </tr>
            <%
            connect co= new connect();
            co.read("select * from consultingtime where doc='"+session.getAttribute("user")+"'");
            while(co.rs.next())
            {
            %>
                <tr>
                    <td><%=getD(co.rs.getInt(3))%></td>
                    <td><%=co.rs.getString(4)%></td>
                  <td><%=co.rs.getString(5)%></td>
                   <td><%=co.rs.getString(6)%></td>
               
                   <td><a href="del1.jsp?id=<%=co.rs.getString(1)%>"><button>remove</button></a>
                   </td>
                      
            </tr>
            <%}%>
                
        </table>
    </body>
</html>
