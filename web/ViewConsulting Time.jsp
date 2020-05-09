<%-- 
    Document   : ViewConsulting Time
    Created on : 14 Feb, 2018, 12:29:28 PM
    Author     : S7
--%>

<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.*"%>


<%@page import="doctorsearch.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
    <body> 
        <span class="close" onclick="cl()"><i class="icon-2x" >&times;</i></span>
        <h2>Consulting Time</h2>
        <table border="1" class="table">
         
            <tr style="background:#df8a13">
                <th >day</th>
            
                  <th>From</th>
                   <th>To</th>
                   <th >no of booking per day</th>
                     <th ></th>
                    
            </tr>
            <%
            connect co= new connect();
             DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            
            Date date = null;
            try {
                date = formatter.parse(request.getParameter("dt"));
            } catch (Exception ex) {
            }
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            // Get values from calendar.
            int day=calendar.get(Calendar.DAY_OF_WEEK);
            co.read("select * from consultingtime where doc='"+request.getParameter("m")+"' and day='"+day+"'");
int i=0;
            while(co.rs.next())
            {
               i++;
            %>
                <tr>
                    <td><%=getD(co.rs.getInt(3))%></td>
                    <td><%=co.rs.getString(4)%></td>
                  <td><%=co.rs.getString(5)%></td>
                   <td><%=co.rs.getString(6)%></td>
               
                   <td><a href="Book?id=<%=co.rs.getString(1)%>&dt=<%=request.getParameter("dt")%>&doc=<%=request.getParameter("m")%>&t1=<%=connect.cid%>&t2=<%=connect.sid%>&t4=<%=connect.loc%>&t3=<%=connect.sp%>"><button class="btn btn-warning"><i class="icon-heart">Book Now</i></button></a>
                   </td>
                      
            </tr>
           
            <%}
            %> <tr>
                <td colspan="5"><%
            if(i==0)
            {
            out.print("<h3>No Consulting on <font color='red'> "+getD(day)+" </font>  Choose another date</h3>");
            }
            %>
                </td>
               </tr> 
        </table>
    </body>
</html>
